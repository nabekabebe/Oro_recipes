import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/pages/DetailsPage.dart';
import '../constants.dart';
import '../data.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  FavouritesCollection _favouritesCollection = new FavouritesCollection();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffold_background,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.centerLeft,
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            "Favorites",
                            style: displayWhiteTextStyle,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top:60,bottom: 20,left: 20),
                child: Text("My Favourites",style: displayTextStyle,),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: ListView.builder(
                      itemCount: _favouritesCollection.favorites.length,
                      itemBuilder: (context,index){
                        var position=_favouritesCollection.favorites[index];
                    return ListTile(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(
                            builder: (BuildContext context){
                              return DetailPage(itemIndex: index,);
                            }
                        ));
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(dummyDataJason[position]["image"]),
                        radius: 30,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(dummyDataJason[position]["name"],style: displayTextStyle),
                          Text(dummyDataJason[position]["Region"],style: inputHintStyle,),
                          SizedBox(height: 6,)
                        ],
                      ),
                      subtitle: Text(dummyDataJason[position]["Description"],style: smallText,),
                      trailing: IconButton(
                        onPressed:(){
                         setState(() {
                           _favouritesCollection.favorites.removeAt(index);
                         });
                        },
                        icon: Container(
                            alignment:Alignment.center,
                          child: Icon(Icons.remove_circle,color: Colors.red,)),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
