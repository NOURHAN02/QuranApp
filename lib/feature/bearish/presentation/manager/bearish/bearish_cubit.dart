import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/shared/shared_save_surah_title.dart';
import 'package:quran_app/feature/bearish/presentation/manager/bearish/bearish_states.dart';

class BearishCubit extends Cubit<BearishStates> {
  BearishCubit() : super(InitialState());
  static BearishCubit get(context) => BlocProvider.of(context);
  void number() {
    SharedUtils.getInt("counter");
  }

  int currentCount = SharedUtils.getInt("counter");
  void incrementCount() async {
    currentCount++;
    await SharedUtils.setInt("counter", currentCount);
    emit(IncrementState());
  }

  void restartCount() async {
    currentCount = currentCount - currentCount;
    await SharedUtils.setInt("counter", currentCount);
    emit(RestartState());
  }
}
