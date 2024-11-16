import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/data/model/quran_model.dart';
import 'package:quran_app/feature/home/presentation/view/widget/details_quran_view.dart';
import 'package:quran_app/feature/home/presentation/view/widget/star.dart';

class CustomerQuranItem extends StatelessWidget {
  const CustomerQuranItem({super.key, required this.quran});
  final QuranModel quran;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsQuranView(
                          quranId: quran.id,
                        )));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Star(
                id: quran.id,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: TextInQuranItem(
                quran: quran,
              )),
              const SizedBox(
                width: 10,
              ),
              Text(
                quran.arabic,
                style: Styles.textStyle17.copyWith(color: Colors.purpleAccent),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class TextInQuranItem extends StatelessWidget {
  const TextInQuranItem({super.key, required this.quran});
  final QuranModel quran;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quran.english,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${quran.name} - ", style: Styles.textStyle14),
            Text("${quran.aya} aya", style: Styles.textStyle10),
          ],
        ),
      ],
    );
  }
}
