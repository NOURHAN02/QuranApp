import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/presentation/manager/location/location_cubit.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_image.dart';

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
                LocationCubit.get(context).place.administrativeArea == null
                    ? const SizedBox()
                    : Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      ' ${LocationCubit.get(context).place.administrativeArea}',
                      style: Styles.textStyle17,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}