import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/service_api/service_api.dart';
import 'package:quran_app/core/widget/customer_error.dart';
import 'package:quran_app/core/widget/customer_loading.dart';
import 'package:quran_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:quran_app/feature/home/presentation/manager/azkar/azkar_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/azkar/azkar_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_item_azkar.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(
        HomeRepoImp(
          ServiceApi(
            Dio(),
          ),
        ),
      )..fetchAllAzkar(),
      child: BlocBuilder<AzkarCubit, AzkarStates>(
        builder: (context, state) {
          if (state is SuccessAzkarState) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomerItemAzkar(
                  azkarModel: state.azkar[index],
                );
              },
              itemCount: 10,
            );
          } else if (state is FailureAzkarState) {
            return CustomerError(errorMessage: state.errorMessage);
          } else {
            return const CustomerLoading();
          }
        },
      ),
    );
  }
}
