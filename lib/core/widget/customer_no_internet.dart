import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';

class CustomerNoInternet extends StatelessWidget {
  const CustomerNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_connected_no_internet_4_outlined,
            size: 200,
            color: Colors.purpleAccent,
          ),
          Text(
            "No Internet Connection",
            style: Styles.textStyle20,
          ),
        ],
      ),
    ));
  }
}
