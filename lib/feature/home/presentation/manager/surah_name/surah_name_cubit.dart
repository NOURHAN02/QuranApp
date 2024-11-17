import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/shared/shared_save_surah_title.dart';
import 'package:quran_app/feature/home/presentation/manager/surah_name/surah_name_states.dart';

class SurahNameCubit extends Cubit<SurahNAmeStates> {
  SurahNameCubit() : super(InitialNameSurahStates());
  static SurahNameCubit get(context) => BlocProvider.of(context);
  Future<void> fetchSurahName() async {
    emit(LoadingNameSurahStates());
    var surahName = SharedUtils.getString("surahQuranSave", "The Opening");
    var surahId = SharedUtils.getInt("SurahId", 1);
    emit(SuccessNameSurahStates(surahName, surahId));
  }
}
