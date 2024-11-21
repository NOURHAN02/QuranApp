import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widget/customer_error.dart';
import 'package:quran_app/core/widget/customer_loading.dart';
import 'package:quran_app/feature/home/presentation/manager/location/location_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/location/location_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_time_adan.dart';

class CustomerAdan extends StatelessWidget {
  const CustomerAdan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationStates>(
      builder: (context, state) {
        if (state is SuccessAdanStates) {
          return const CustomerTimeAdan();
        } else if (state is FailureLocationStates ||
            state is FailureAdanStates) {
          final errorMessage = state is FailureLocationStates
              ? state.errorMessage
              : 'Error loading prayer times';

          return CustomerError(errorMessage: errorMessage);
        } else {
          return const CustomerLoading();
        }
      },
    );
  }
}


