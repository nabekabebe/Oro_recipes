import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/customWidgets/bannerLogo.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQuerySize md = new MediaQuerySize(context: context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Text("About",),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BannerLogo(
                    mediaSize: md.getWidth()-60,
                    sizeFactor: 70,
                  ),
                  Text(
                    "Oromo Food Recipes",
                    style: heading2Style,
                  ),
                  Text(
                    "Verion 1.0.0",
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  child: Text("Developed By: Nabek Abebe")),
            ),
          ],
        ),
      ),
    );
  }
}
