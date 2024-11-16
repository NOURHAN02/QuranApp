import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/asset/asset_data.dart';

class Star extends StatelessWidget {
  const Star({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AssetData.startImage),
        Text(
          "$id",
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
