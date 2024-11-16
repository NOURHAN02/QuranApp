// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:quran_app/core/function/paly_audio.dart';
// import 'package:quran_app/core/utils/style/styles.dart';
// import 'package:quran_app/core/widget/customer_bottom.dart';
// import 'package:quran_app/feature/home/data/model/surah_model.dart';
// import 'package:quran_app/feature/home/presentation/view/widget/customer_aya_item.dart';
// import 'package:quran_app/feature/home/presentation/view/widget/star.dart';
//
// class CustomerAyaItem extends StatefulWidget {
//   const CustomerAyaItem({
//     super.key,
//     required this.ayahsModel,
//   });
//   final AyahsModel ayahsModel;
//
//   @override
//   State<CustomerAyaItem> createState() => _CustomerAyaItemState();
// }
//
// class _CustomerAyaItemState extends State<CustomerAyaItem> {
//   bool isPlayText=false;
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   @override
//   void initState() {
//     super.initState();
//     // Listen to the player state changes
//     _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
//       setState(() {
//         isPlayText = state == PlayerState.playing;
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: ()async{
//      // isPlayText=await playerText(widget.ayahsModel);
//
//
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               Star(
//                 id: widget.ayahsModel.numberInSurah,
//               ),
//               Expanded(
//                 child: Center(
//                   child: isPlayText?Text(
//                     widget.ayahsModel.text,
//                     maxLines: null,
//                     style: Styles.textStyle20.copyWith(color: Colors.purpleAccent),
//                     textDirection: TextDirection.rtl,
//                   ):Text(
//                     widget.ayahsModel.text,
//                     maxLines: null,
//                     style: Styles.textStyle20,
//                     textDirection: TextDirection.rtl,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           const Divider(),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';
import 'package:quran_app/feature/home/presentation/view/widget/star.dart';

class CustomerAyaItem extends StatelessWidget {
  const CustomerAyaItem({
    super.key,
    required this.ayahsModel,
    required this.isPlayText,
  });

  final AyahsModel ayahsModel;
  final bool isPlayText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Star(
              id: ayahsModel.numberInSurah,
            ),
            Expanded(
              child: Center(
                child: isPlayText
                    ? Text(
                        ayahsModel.text.contains(
                                "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")
                            ? 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم\n${ayahsModel.text.replaceFirst("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", "")}'
                            : ayahsModel.text,
                        maxLines: null,
                        style: Styles.textStyle20
                            .copyWith(color: Colors.purpleAccent),
                        textDirection: TextDirection.rtl,
                      )
                    : Text(
                        ayahsModel.text.contains(
                                "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")
                            ? 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيم\n${ayahsModel.text.replaceFirst("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", "")}'
                            : ayahsModel.text,
                        maxLines: null,
                        style: Styles.textStyle20,
                        textDirection: TextDirection.rtl,
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(),
      ],
    );
  }
}
