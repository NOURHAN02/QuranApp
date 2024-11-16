import 'package:flutter/material.dart';
import 'package:quran_app/core/shared/shared_save_surah_title.dart';
import 'package:quran_app/feature/home/presentation/view/home_view.dart';
import 'package:quran_app/feature/splash/presentation/view/widget/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nav();
    firstTime();
    SharedUtils.setBool("firstTime", false);
  }

  void nav() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }

  void firstTime() async {
    await SharedUtils.setBool("firstTime", true);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ImageBody()),
    );
  }
}
