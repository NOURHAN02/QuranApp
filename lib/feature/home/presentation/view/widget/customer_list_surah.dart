import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';
import 'package:quran_app/feature/home/presentation/manager/botton_play_audio/botton_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/botton_play_audio/botton_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_aya_item.dart';

class CustomerListSurah extends StatelessWidget {
  const CustomerListSurah({super.key, required this.surahModel});
  final SurahModel surahModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottonCubit, BottonStates>(
      builder: (context, state) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: surahModel.ayahs.length,
          itemBuilder: (context, index) {
            return CustomerAyaItem(
              ayahsModel: surahModel.ayahs[index],
              isPlayText: state is AyahNumberStateUpdate
                  ? surahModel.ayahs[index].numberInSurah == state.id
                      ? true
                      : false
                  : (state is IsPauseBottonState
                      ? surahModel.ayahs[index].numberInSurah == state.id
                          ? true
                          : false
                      : surahModel.ayahs[index].numberInSurah == 0
                          ? true
                          : false),
            );
          },
        );
      },
    );
  }
}
