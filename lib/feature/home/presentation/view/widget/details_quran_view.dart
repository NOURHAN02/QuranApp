import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/service_api/service_api.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/botton_play_audio/botton_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/surah/surah_cubit.dart';
import 'package:quran_app/feature/home/presentation/view/widget/details_quran_bady.dart';

class DetailsQuranView extends StatelessWidget {
  const DetailsQuranView({super.key, required this.quranId});

  final int quranId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahCubit(HomeRepoImp(ServiceApi(Dio())))
            ..fetchSurahDetails(surahNum: quranId),
        ),
        BlocProvider(create: (context) => BottonCubit()),
      ],
      child: const Scaffold(
        body: DetailsQuranBody(),
      ),
    );
  }
}
