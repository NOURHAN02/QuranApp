import 'package:quran_app/feature/home/data/model/azkar_model.dart';

abstract class AzkarStates {}

class InitialState extends AzkarStates {}

class LoadingAzkarState extends AzkarStates {}

class SuccessAzkarState extends AzkarStates {
  final List<AzkarModel> azkar;

  SuccessAzkarState(this.azkar);
}

class FailureAzkarState extends AzkarStates {
  final String errorMessage;

  FailureAzkarState(this.errorMessage);
}
