import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';
import 'package:quran_app/feature/home/presentation/manager/botton_play_audio/botton_states.dart';

class BottonCubit extends Cubit<BottonStates> {
  BottonCubit() : super(InitialState());
  static BottonCubit get(context) => BlocProvider.of(context);

  bool isPlay = false;
  final AudioPlayer audioPlay = AudioPlayer();
  int currentAyah = 0;

  Future<void> triggerAudio(SurahModel surahModel) async {
    if (!isPlay) {
      isPlay = true;
      emit(IsPlayBottonState());
      for (var item in surahModel.ayahs) {
        await _playAyah(item);
      }
      isPlay = false;
      emit(IsPlayBottonState());
    } else {
      if (audioPlay.state == PlayerState.playing) {
        await audioPlay.pause();
        emit(IsPauseBottonState(currentAyah));
      } else if (audioPlay.state == PlayerState.paused) {
        await audioPlay.resume();
        emit(AyahNumberStateUpdate(currentAyah));
      }
    }
  }

  Future<void> _playAyah(AyahsModel ayah) async {
    currentAyah = ayah.numberInSurah;
    emit(AyahNumberStateUpdate(currentAyah));
    await audioPlay.play(UrlSource(ayah.audio));
    await audioPlay.onPlayerComplete.first;
  }

  String getButtonText(BottonStates state) {
    if (state is IsPlayBottonState) {
      return 'play';
    }
    if (state is AyahNumberStateUpdate) {
      return 'Pause';
    } else if (state is IsPauseBottonState) {
      return 'Resume';
    } else {
      return 'Play';
    }
  }
}
