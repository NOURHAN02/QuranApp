import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/asset/asset_data.dart';

class ImageBody extends StatelessWidget {
  const ImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AssetData.splashImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
            left: 20,
            top: 100,
            bottom: 100,
            child: Text(
              "Learn Quran and Recite ",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
      ],
    );
  }
}
