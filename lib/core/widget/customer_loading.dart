import 'package:flutter/material.dart';

class CustomerLoading extends StatelessWidget {
  const CustomerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
