import 'package:flutter/material.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/customWidgets/bannerLogo.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQuerySize md = new MediaQuerySize(context: context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffold_background,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed:(){
                      Navigator.pop(context);
                    },
                      icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(width: 30,),
                  Text("About",style: displayTextStyle,)
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  BannerLogo(
                    mediaSize: md.getWidth()-70,
                    sizeFactor: 70,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 50.0, top: 30.0),
                    child: Text(
                      "Oromo Food Recipes",
                      style: heading2Style,
                    ),
                  ),
                  Container(
                      child: Text(
                        "Verion 1.0.0",
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("Developed By: Nabek Abebe"),
            ),
          ],
        ),
      ),
    );
  }
}
