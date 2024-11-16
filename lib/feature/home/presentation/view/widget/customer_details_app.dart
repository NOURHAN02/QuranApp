import 'package:flutter/material.dart';

class CustomerDetailsApp extends StatelessWidget {
  const CustomerDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Details Surah"),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.navigate_before_rounded,
          size: 40,
        ),
      ),
    );
  }
}
