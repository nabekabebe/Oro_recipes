import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/pages/DetailsPage.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../data.dart';
import '../state.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  FavCollection _collection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _collection = new FavCollection();
  }

  @override
  Widget build(BuildContext context) {
    var _state = Provider.of<SettingsState>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Favorites",style: displayTextWhiteBold,),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 54,
          color: Colors.black,
          backgroundColor: !_state.nightMode?navIndicatorLight:navIndicatorDark,
          buttonBackgroundColor: Colors.red,
          animationDuration: Duration(milliseconds: 100),
          index: 0,
          onTap: (index){
            Navigator.push(context,MaterialPageRoute(
                builder: (BuildContext context){
                  return pages[index];
                }
            ));
            },
          items: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.white,
              size: 26,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
              size: 26,
            ),
            Icon(
              Icons.category,
              color: Colors.white,
              size: 26,
            ),
          ],
          animationCurve: Curves.easeInCirc,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14,vertical:40),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom:20),
                child: Text("My Favourites",style: displayTextWhiteBold,),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _collection.itemGet(),
                    itemBuilder: (context,index){
                      var position=_collection.favGet()[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(
                            builder: (BuildContext context){
                              return DetailPage(itemIndex: position,offline: false,);
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
                            _collection.favRemove(index);
                         });
                        },
                        icon: Container(
                            alignment:Alignment.center,
                          child: Icon(Icons.remove_circle,color: Colors.red,)),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
