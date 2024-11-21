// import 'package:flutter/material.dart';
// import 'package:quran_app/feature/home/presentation/view/widget/home_view_body.dart';
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(child: HomeViewBody()),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/core/widget/customer_no_internet.dart';
import 'package:quran_app/feature/home/presentation/manager/internet/internet_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/internet/internet_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetStates>(
      builder: (context, state) {
        if (state is InternetConnection) {
          return const Scaffold(
            body: SafeArea(child: HomeViewBody()),
          );
        } else if (state is InternetNoConnection) {
          return const CustomerNoInternet();
        }
        return const SizedBox();
      },
    );
  }
}
