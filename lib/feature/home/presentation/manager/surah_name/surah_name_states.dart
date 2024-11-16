abstract class SurahNAmeStates {}

class SuccessNameSurahStates extends SurahNAmeStates {
  final String surahName;
  final int surahId;
  SuccessNameSurahStates(this.surahName, this.surahId);
}

class LoadingNameSurahStates extends SurahNAmeStates {}

class InitialNameSurahStates extends SurahNAmeStates {}
