import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100, // Width of the line
        height: 2, // Height of the line
        color: Colors.purpleAccent, // Line color
      ),
    );
  }
}
