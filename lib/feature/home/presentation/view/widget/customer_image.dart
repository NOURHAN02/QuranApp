import 'package:flutter/material.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(colors: [
          Colors.purpleAccent,
          Colors.blueAccent,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(16.0),
    //   child: AspectRatio(aspectRatio: 2.5/1,
    //     child: Image.asset("assets/images/img_2.png",fit: BoxFit.fill,),),
    //
    // );
  }
}
