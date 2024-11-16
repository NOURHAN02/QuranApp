import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/data/model/azkar_model.dart';
import 'package:quran_app/feature/home/presentation/view/widget/details_azkar_view.dart';
import 'package:quran_app/feature/home/presentation/view/widget/star.dart';

class CustomerItemAzkar extends StatelessWidget {
  const CustomerItemAzkar({super.key, required this.azkarModel});
  final AzkarModel azkarModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerDetailsAzkar(
                    azkarCategory: azkarModel.category,
                  ),
                ));
          },
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Star(
                  id: azkarModel.id == 545451
                      ? 2
                      : azkarModel.id == 1
                          ? 1
                          : azkarModel.id + 1),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Text(
                azkarModel.category,
                textDirection: TextDirection.rtl,
                style: Styles.textStyle20,
              )),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.navigate_before,
                size: 36,
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
