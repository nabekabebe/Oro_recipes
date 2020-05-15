import 'package:flutter/material.dart';


class BannerLogo extends StatelessWidget {
  final double mediaSize;
  final int sizeFactor;

  BannerLogo({this.mediaSize,this.sizeFactor});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Center(
        child: Image.asset('images/abba_gada.png',width:mediaSize-sizeFactor),
      )
      ,);
  }
}
