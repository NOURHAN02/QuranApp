import 'package:flutter/material.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_circle_widget.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_line.dart';

class CustomerShapeDetails extends StatelessWidget {
  const CustomerShapeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleWidget(),
           SizedBox(
            width: 10,
          ),
          LineWidget(),
           SizedBox(
            width: 10,
          ),
          CircleWidget(),
           SizedBox(
            width: 10,
          ),
          LineWidget(),
           SizedBox(
            width: 10,
          ),
          CircleWidget(),
        ],
      ),
    );
  }
}
