import 'package:flutter/material.dart';
import 'package:oro_recipes/pages/CategoryListPage.dart';
import 'package:oro_recipes/pages/FavoritesPage.dart';
import 'package:oro_recipes/pages/HomePage.dart';

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
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

const displayTextWhiteBold = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
);



const displayWhiteTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
);

//dark mode states
const searchBgColorDark=Colors.black;
const searchBgColorWhite=Color(0xFFF1F5F8);

var navIndicatorDark =  Colors.grey[750];
var navIndicatorLight =  Colors.white;

const displayCardLight = Color(0xFFcebc9c);
const displayCardDark = Color(0xFFf5deb3);



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

//page Routing Enums

var pages={
  0:FavoritesPage(),
  1:HomePage(),
  2:RegionalRecipeList(scrollIndex: 0,),
};

