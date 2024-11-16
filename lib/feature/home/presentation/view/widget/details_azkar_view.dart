import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/service_api/service_api.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/azkar_details/azkar_details_cubit.dart';
import 'package:quran_app/feature/home/presentation/view/widget/details_azkar_body.dart';

class CustomerDetailsAzkar extends StatelessWidget {
  const CustomerDetailsAzkar({super.key, required this.azkarCategory});
  final String azkarCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarDetailsCubit(
        HomeRepoImp(
          ServiceApi(
            Dio(),
          ),
        ),
      )..fetchDetailsAzkar(category: azkarCategory),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.navigate_before,
                size: 34,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                azkarCategory,
                style: Styles.textStyle17,
              ),
            ],
          ),
        ),
        body: const DetailsAzkarBody(),
      ),
    );
  }
}
