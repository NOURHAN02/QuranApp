import 'package:quran_app/feature/home/data/model/quran_model.dart';

abstract class QuranStates {}

class InitialState extends QuranStates {}

class LoadingQuranState extends QuranStates {}

class SuccessQuranState extends QuranStates {
  final List<QuranModel> quran;

  SuccessQuranState(this.quran);
}

class FailureQuranState extends QuranStates {
  final String errorMessage;

  FailureQuranState(this.errorMessage);
}
