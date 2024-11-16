import 'package:flutter/material.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_info_details.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_info_image_details.dart';

class CustomerTopDetailsQuran extends StatelessWidget {
  const CustomerTopDetailsQuran({super.key, required this.surahModel});
  final SurahModel surahModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: CustomerInfoDetails(
              surahModel: surahModel,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: CustomerInfoImageDetails(
              surahModel: surahModel,
            ),
          )
        ],
      ),
    );
  }
}
