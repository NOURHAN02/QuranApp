import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/core/widget/customer_error.dart';
import 'package:quran_app/core/widget/customer_loading.dart';

import 'package:quran_app/feature/home/presentation/manager/location/location_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/location/location_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_image.dart';

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

class CustomerTimeAdan extends StatelessWidget {
  const CustomerTimeAdan({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: Stack(
        children: [
          const CustomerImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocationCubit.get(context).nextPrayerName,
                    style: Styles.textStyle20),
                Text(LocationCubit.get(context).nextPrayerTime,
                    style: Styles.textStyle20),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      ' ${LocationCubit.get(context).place.administrativeArea}-${LocationCubit.get(context).place.subAdministrativeArea}',
                      style: Styles.textStyle17,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
