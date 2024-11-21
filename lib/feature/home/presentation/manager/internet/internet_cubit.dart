import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/home/presentation/manager/internet/internet_states.dart';

class InternetCubit extends Cubit<InternetStates> {
  InternetCubit() : super(InitialState());
  StreamSubscription? subscription;
  void internet() async {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        emit(InternetConnection());
      } else {
        emit(InternetNoConnection());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
