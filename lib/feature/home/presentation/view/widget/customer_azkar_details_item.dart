import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/data/model/azkar_model.dart';

class CustomerAzkarDetailsItem extends StatelessWidget {
  const CustomerAzkarDetailsItem({super.key, required this.arrayItem});
  final Array arrayItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.purpleAccent),
                child: Center(
                    child: Text(
                  "${arrayItem.count}",
                  style: Styles.textStyle20,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                arrayItem.text,
                textDirection: TextDirection.rtl,
                style: Styles.textStyle20,
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
