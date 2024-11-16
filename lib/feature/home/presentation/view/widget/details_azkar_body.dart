import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widget/customer_error.dart';
import 'package:quran_app/core/widget/customer_loading.dart';
import 'package:quran_app/feature/home/presentation/manager/azkar_details/azkar_details_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/azkar_details/azkar_details_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_azkar_details_item.dart';

class DetailsAzkarBody extends StatelessWidget {
  const DetailsAzkarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarDetailsCubit, AzkarDetailsStates>(
      builder: (context, state) {
        if (state is SuccessAzkarDetailsState) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.azkarModel.array.length,
            itemBuilder: (context, index) {
              return CustomerAzkarDetailsItem(
                arrayItem: state.azkarModel.array[index],
              );
            },
          );
        } else if (state is FailureAzkarDetailsState) {
          return CustomerError(errorMessage: state.errorMessage);
        } else {
          return const CustomerLoading();
        }
      },
    );
  }
}
