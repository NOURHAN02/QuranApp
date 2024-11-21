import 'package:flutter/material.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(colors: [
          Colors.purpleAccent,
          Colors.blueAccent,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
    );

  }
}
