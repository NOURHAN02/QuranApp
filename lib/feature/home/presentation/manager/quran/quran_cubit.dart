import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/quran/quran_states.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit(this.homeRepoImp) : super(InitialState());
  final HomeRepoImp homeRepoImp;
  static QuranCubit get(context) => BlocProvider.of(context);
  Future<void> fetchAllQuran() async {
    emit(LoadingQuranState());
    var result = await homeRepoImp.fetchAllSurah();
    result.fold((failure) {
      print("Failure data ::*********************");
      emit(FailureQuranState(failure.errorMessage));
    }, (quran) {
      print("Success data *********************");
      emit(SuccessQuranState(quran));
    });
  }
}
