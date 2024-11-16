import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/asset/asset_data.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/presentation/manager/surah_name/surah_name_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/surah_name/surah_name_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/bottom_continue.dart';
import 'package:quran_app/feature/home/presentation/view/widget/details_quran_view.dart';

class CustomerLastReadBody extends StatelessWidget {
  const CustomerLastReadBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Last Read",
                      style: Styles.textStyle20,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    BlocBuilder<SurahNameCubit, SurahNAmeStates>(
                      builder: (context, state) {
                        if (state is SuccessNameSurahStates) {
                          return Text(
                            state.surahName,
                            style: Styles.textStyle20,
                          );
                        } else {
                          return const Text("data");
                        }
                      },
                    ),
                    BlocBuilder<SurahNameCubit, SurahNAmeStates>(
                      builder: (context, state) {
                        if (state is SuccessNameSurahStates) {
                          return BottomContinue(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsQuranView(quranId: state.surahId),
                                ),
                              );
                            },
                            text: "continue read ",
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Image.asset(
                AssetData.logoImage,
                height: 90,
                width: 90,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
