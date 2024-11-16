import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';

class BottomContinue extends StatelessWidget {
  const BottomContinue({super.key, required this.text, this.onPressed});
  final String text;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffCBADEF).withOpacity(.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          maximumSize: const Size(170, 60)),
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            text,
            style: Styles.textStyle18
                .copyWith(color: Colors.white.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
