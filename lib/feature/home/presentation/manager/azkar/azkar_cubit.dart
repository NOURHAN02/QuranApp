import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/azkar/azkar_states.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit(this.homeRepoImp) : super(InitialState());
  final HomeRepoImp homeRepoImp;
  Future<void> fetchAllAzkar() async {
    emit(LoadingAzkarState());
    var result = await homeRepoImp.fetchAllAzkar();
    result.fold((failure) {
      emit(FailureAzkarState(failure.errorMessage));
    }, (azkar) {
      emit(SuccessAzkarState(azkar));
    });
  }
}
