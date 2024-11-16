import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/shared/shared_save_surah_title.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/core/widget/customer_bottom.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';
import 'package:quran_app/feature/home/presentation/manager/botton_play_audio/botton_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/botton_play_audio/botton_states.dart';
import 'package:quran_app/feature/home/presentation/manager/surah_name/surah_name_cubit.dart';

class CustomerInfoDetails extends StatelessWidget {
  const CustomerInfoDetails({super.key, required this.surahModel});

  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1B2424),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                surahModel.englishNameTranslation,
                maxLines: 2,
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(surahModel.englishName, style: Styles.textStyle17),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Component -",
                    style: Styles.textStyle14,
                  ),
                  Text("${surahModel.numberOfAyahs} sentences",
                      style: Styles.textStyle14),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<BottonCubit, BottonStates>(
                    builder: (context, state) {
                      return CustomerBottom(
                          onPressed: () async {
                            await BottonCubit.get(context)
                                .triggerAudio(surahModel);
                          },
                          color: Colors.purpleAccent,
                          bottonText:
                              BottonCubit.get(context).getButtonText(state),
                          textStyle: Styles.textStyle14);
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        SharedUtils.setString("surahQuranSave",
                            surahModel.englishNameTranslation);
                        SharedUtils.setInt("SurahId", surahModel.number);
                        SurahNameCubit.get(context).fetchSurahName();
                      },
                      icon: const Icon(Icons.bookmark)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
