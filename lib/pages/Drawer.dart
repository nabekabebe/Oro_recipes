import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oro_recipes/pages/About.dart';
import 'package:oro_recipes/pages/SettingsPage.dart';
import 'package:oro_recipes/pages/FavoritesPage.dart';

class CustomDrawer extends StatelessWidget {

  Widget _drawerList(IconData icon,String label,bool isPage,BuildContext c,Widget destination){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFBDBDBD),
              width: 2,
            ),
          ),
        ),
        child: InkWell(
          onTap: (){
            if(isPage){
            Navigator.push(c,MaterialPageRoute(
                builder: (BuildContext context){
                  return destination;
                }
            ));
            }
          },
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(icon,color: Color(0xFFD97D54),),
              SizedBox(width: 15,),
              Text(label),
              isPage ? Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.chevron_right),
                ),
              ):Container(),
            ],
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {

    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(width: 300),
        child: Material(
          color: Color(0xFFede8e8),
          elevation: 0,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/abba_gada.png"),
                        fit: BoxFit.contain,
                      ),
                      ),
                  )),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _drawerList(FontAwesomeIcons.heartbeat,"Favourites",true,context,FavoritesPage()),
                    _drawerList(FontAwesomeIcons.cog,"Settings",true,context,SettingsPage()),
                    _drawerList(Icons.info,"About",true,context,AboutPage()),
                    _drawerList(Icons.share,"Share",false,context,Container()),
                    _drawerList(Icons.update,"Check for Update",false,context,Container()),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Text("Version 1.0.0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),))),
            ],
          ),
        ),
      ),
    );
  }
}

