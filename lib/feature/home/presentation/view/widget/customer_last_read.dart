import 'package:flutter/material.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_Last_read_bady.dart';

class CustomerLastRead extends StatelessWidget {
  const CustomerLastRead({super.key});

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
      child: const CustomerLastReadBody(),
    );
  }
}
