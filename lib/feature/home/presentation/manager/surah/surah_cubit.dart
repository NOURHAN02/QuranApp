import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/surah/surah_states.dart';

class SurahCubit extends Cubit<SurahStates> {
  SurahCubit(this.homeRepoImp) : super(InitialStates());

  final HomeRepoImp homeRepoImp;
  Future<void> fetchSurahDetails({required int surahNum}) async {
    emit(LoadingSurahStates());
    var result = await homeRepoImp.fetchSurahDetails(surahNum: surahNum);
    result.fold((failure) {
      emit(FailureSurahStates(failure.errorMessage));
    }, (surah) {
      emit(SuccessSurahStates(surah: surah));
    });
  }
}
