import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/asset/asset_data.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';

class CustomerInfoImageDetails extends StatelessWidget {
  const CustomerInfoImageDetails({super.key, required this.surahModel});
  final SurahModel surahModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(
                    AssetData.splashImage,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              left: 20,
              top: 30,
              right: 20,
              child: Text(
                surahModel.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Styles.textStyle20,
              )),
        ],
      ),
    );
  }
}
