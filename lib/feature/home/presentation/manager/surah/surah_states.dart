import 'package:quran_app/feature/home/data/model/surah_model.dart';

abstract class SurahStates {}

class InitialStates extends SurahStates {}

class LoadingSurahStates extends SurahStates {}

class SuccessSurahStates extends SurahStates {
  final List<SurahModel> surah;
  SuccessSurahStates({required this.surah});
}

class FailureSurahStates extends SurahStates {
  final String errorMessage;

  FailureSurahStates(this.errorMessage);
}
