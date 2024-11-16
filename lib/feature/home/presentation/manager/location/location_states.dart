abstract class LocationStates {}

class InitialStates extends LocationStates {}

class SuccessLocationStates extends LocationStates {}

class FailureLocationStates extends LocationStates {
  final String errorMessage;
  FailureLocationStates(this.errorMessage);
}

class SuccessAdanStates extends LocationStates {}

class FailureAdanStates extends LocationStates {
  final String errorMessage;
  FailureAdanStates(this.errorMessage);
}
