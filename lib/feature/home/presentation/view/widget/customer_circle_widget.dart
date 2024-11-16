import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.transparent, // Outer border
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}
