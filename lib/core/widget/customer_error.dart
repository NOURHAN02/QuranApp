import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';

class CustomerError extends StatelessWidget {
  const CustomerError({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            errorMessage,
            style: Styles.textStyle17,
          ),
        ),
      ],
    );
  }
}
