abstract class BottonStates {}

class InitialState extends BottonStates {}

class IsPlayBottonState extends BottonStates {}

class IsPauseBottonState extends BottonStates {
  final int id;

  IsPauseBottonState(this.id);
}

class AyahNumberStateUpdate extends BottonStates {
  final int id;

  AyahNumberStateUpdate(this.id);
}
