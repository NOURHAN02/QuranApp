import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/bearish/presentation/view/bearish_view.dart';

class OtherView extends StatelessWidget {
  const OtherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomerItemOther(
            textName: 'سبحة',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BearishView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomerItemOther extends StatelessWidget {
  const CustomerItemOther({super.key, required this.textName, this.onTap});
  final String textName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Text(
            textName,
            style: Styles.textStyle20,
          ),
          const Spacer(),
          const Icon(
            Icons.navigate_before_rounded,
          ),
        ],
      ),
    );
  }
}
