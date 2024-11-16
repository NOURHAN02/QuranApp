import 'package:flutter/material.dart';

class CustomerBottom extends StatelessWidget {
  const CustomerBottom({
    super.key,
    required this.color,
    required this.bottonText,
    required this.textStyle,
    this.onPressed,
  });
  final Color color;
  final String bottonText;
  final TextStyle textStyle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(70, 30),
          disabledBackgroundColor: color,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          bottonText,
          style: textStyle.copyWith(color: Colors.white),
        ));
  }
}
