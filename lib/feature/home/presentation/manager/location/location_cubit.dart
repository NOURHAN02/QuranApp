import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/location/location_states.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit(this.homeRepoImp) : super(InitialStates());
  static LocationCubit get(context) => BlocProvider.of(context);
  final HomeRepoImp homeRepoImp;
  Future<Position> determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  late Placemark place;
  Future<void> getLocation() async {
    try {
      Position position = await determinePosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      place = placemarks[0];
      emit(SuccessLocationStates());
    } catch (e) {
      emit(FailureLocationStates(e.toString()));
    }
  }

  String getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(now);
  }

  String nextPrayerName = '';
  String nextPrayerTime = '';

  Future<void> getAdan() async {
    Position position = await determinePosition();

    var result = await homeRepoImp.fetchAdan(
      data: getCurrentDate(),
      latitude: "${position.latitude}",
      longitude: '${position.longitude}',
    );

    result.fold((failure) {
      emit(FailureAdanStates(failure.errorMessage));
    }, (adan) {
      final timeNow = DateTime.now();
      DateTime? nextAdanTime;
      adan.timeAdan.toMap().forEach((time, payName) {
        DateTime timeData = DateFormat("HH:mm").parse(time);
        final adanTime = DateTime(timeNow.year, timeNow.month, timeNow.day,
            timeData.hour, timeData.minute);

        if (adanTime.isAfter(timeNow) &&
            (nextAdanTime == null || adanTime.isBefore(nextAdanTime!))) {
          nextAdanTime = adanTime;
          String time12Hour = DateFormat("h:mm a").format(nextAdanTime!);
          nextPrayerName = payName;
          nextPrayerTime = time12Hour;
        }
      });
      emit(SuccessAdanStates());
    });
  }
}
