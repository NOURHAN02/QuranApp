import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/shared/shared_save_surah_title.dart';
import 'package:quran_app/core/utils/service_api/service_api.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/bloc_observer.dart';
import 'package:quran_app/feature/home/presentation/manager/internet/internet_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/location/location_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/quran/quran_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/surah_name/surah_name_cubit.dart';
import 'package:quran_app/feature/home/presentation/view/home_view.dart';
import 'package:quran_app/feature/splash/presentation/view/splash_view.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedUtils.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isFirstTime = SharedUtils.getBool("firstTime");
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetCubit()..internet()),
        BlocProvider(
          create: (context) => QuranCubit(
            HomeRepoImp(
              ServiceApi(
                Dio(),
              ),
            ),
          )..fetchAllQuran(),
        ),
        BlocProvider(create: (context) => SurahNameCubit()..fetchSurahName()),
        BlocProvider(
          create: (context) => LocationCubit(
            HomeRepoImp(
              ServiceApi(Dio()),
            ),
          )
            ..getAdan()
            ..getLocation(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(),
        ),
        home: isFirstTime ? const SplashView() : const HomeView(),
      ),
    );
  }
}
