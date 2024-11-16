import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/bearish/presentation/manager/bearish/bearish_cubit.dart';
import 'package:quran_app/feature/bearish/presentation/view/widget/bearish_view_body.dart';

class BearishView extends StatelessWidget {
  const BearishView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BearishCubit()..number(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.navigate_before,
                size: 35,
              )),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "سبحة",
                textAlign: TextAlign.right,
                style: Styles.textStyle17,
              ),
            ],
          ),
        ),
        body: const BearishViewBody(),
      ),
    );
  }
}
