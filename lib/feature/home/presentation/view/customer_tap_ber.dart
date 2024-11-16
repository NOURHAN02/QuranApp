import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/core/widget/customer_bottom.dart';
import 'package:quran_app/feature/home/presentation/view/widget/azkar_view.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_quran_list.dart';
import 'package:quran_app/feature/home/presentation/view/widget/other_view.dart';

class CustomerTapBer extends StatefulWidget {
  const CustomerTapBer({super.key});

  @override
  State<CustomerTapBer> createState() => _CustomerTapBerState();
}

class _CustomerTapBerState extends State<CustomerTapBer> {
  int currentState = 0;
  final List<Widget> pages = [
    const CustomerQuranList(),
    const AzkarView(),
    const OtherView(),
  ];
  void onTap(int index) {
    currentState = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomerBottom(
                onPressed: () {
                  onTap(0);
                },
                color: currentState == 0
                    ? Colors.purpleAccent
                    : const Color(0xff253131),
                bottonText: "Surah",
                textStyle: Styles.textStyle18),
            const SizedBox(
              width: 15,
            ),
            CustomerBottom(
                onPressed: () {
                  onTap(1);
                },
                color: currentState == 1
                    ? Colors.purpleAccent
                    : const Color(0xff253131),
                bottonText: "Azkar",
                textStyle: Styles.textStyle18),
            const SizedBox(
              width: 15,
            ),
            CustomerBottom(
                onPressed: () {
                  onTap(2);
                },
                color: currentState == 2
                    ? Colors.purpleAccent
                    : const Color(0xff253131),
                bottonText: "Other",
                textStyle: Styles.textStyle18)
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        pages[currentState],
      ],
    );
  }
}
