import 'package:flutter/material.dart';

const inputHintStyle = TextStyle(fontSize: 11);
const scaffold_background = Colors.white;
const headingStyle = TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.w400,
  shadows: [
    Shadow(
      offset: Offset(2.0, 1.0),
      color: Colors.grey,
      blurRadius: 2.0,
    )
  ],
);

const smallText=TextStyle(
  color: Colors.black45,
  fontSize: 13,
);

const heading2Style = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w300,
);

const heading2StyleBold = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const displayTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

const displayTextWhiteBold = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

const richTextStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.w600,
);

const displayWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.normal,
);

class MediaQuerySize {
  BuildContext context;
  MediaQuerySize({this.context});

  double getHeight() {
    return MediaQuery.of(context).size.height;
  }

  double getWidth() {
    return MediaQuery.of(context).size.width;
  }
}
