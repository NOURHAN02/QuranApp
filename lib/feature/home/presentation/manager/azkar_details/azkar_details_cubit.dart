import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/home/data/model/azkar_model.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/azkar_details/azkar_details_states.dart';

class AzkarDetailsCubit extends Cubit<AzkarDetailsStates> {
  AzkarDetailsCubit(this.homeRepoImp) : super(InitialState());

  final HomeRepoImp homeRepoImp;

  Future<void> fetchDetailsAzkar({required String category}) async {
    emit(LoadingAzkarDetailsState());

    var result = await homeRepoImp.fetchAllAzkar();

    result.fold(
      (failure) {
        emit(FailureAzkarDetailsState(failure.errorMessage));
      },
      (azkar) {
        AzkarModel? azkarDetails;

        for (var item in azkar) {
          if (item.category == category) {
            azkarDetails = item;
            break;
          }
        }

        if (azkarDetails != null) {
          emit(SuccessAzkarDetailsState(azkarDetails));
        } else {
          emit(FailureAzkarDetailsState('No details found for this category'));
        }
      },
    );
  }
}
