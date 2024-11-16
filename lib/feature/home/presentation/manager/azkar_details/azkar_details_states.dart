import 'package:quran_app/feature/home/data/model/azkar_model.dart';

abstract class AzkarDetailsStates {}

class InitialState extends AzkarDetailsStates {}

class LoadingAzkarDetailsState extends AzkarDetailsStates {}

class SuccessAzkarDetailsState extends AzkarDetailsStates {
  final AzkarModel azkarModel;

  SuccessAzkarDetailsState(this.azkarModel);
}

class FailureAzkarDetailsState extends AzkarDetailsStates {
  final String errorMessage;

  FailureAzkarDetailsState(this.errorMessage);
}
