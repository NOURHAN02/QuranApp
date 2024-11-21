import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widget/customer_error.dart';
import 'package:quran_app/core/widget/customer_loading.dart';
import 'package:quran_app/core/widget/customer_no_internet.dart';
import 'package:quran_app/feature/home/presentation/manager/internet/internet_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/internet/internet_states.dart';
import 'package:quran_app/feature/home/presentation/manager/quran/quran_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/quran/quran_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_quran_item.dart';

class CustomerQuranList extends StatelessWidget {
  const CustomerQuranList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranStates>(
      builder: (context, state) {
        if (state is SuccessQuranState) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.quran.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomerQuranItem(
                    quran: state.quran[index],
                  ),
                );
              });
        } else if (state is FailureQuranState) {
          return CustomerError(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomerLoading();
        }
      },
    );
  }
}
