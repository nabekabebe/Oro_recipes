import 'package:flutter/material.dart';



const scafold_background = Color(0xFFF9F9F9);
const headingStyle = TextStyle(
  fontSize: 37,
  fontWeight: FontWeight.w400,
  shadows: [
    Shadow(
      offset: Offset(2.0,1.0),
      color: Colors.grey,
      blurRadius: 2.0,
    )
  ],
);

const displayTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const richTextStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.w600,
);

class MediaQuerySize{
  BuildContext context;
  MediaQuerySize({this.context});

  double getHeight(){
    return MediaQuery.of(context).size.height;
  }
  double getWidth(){
    return MediaQuery.of(context).size.width;
  }
}

