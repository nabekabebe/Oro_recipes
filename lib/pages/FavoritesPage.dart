import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/customWidgets/searchBar.dart';
import '../constants.dart';

import '../data.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    MediaQuerySize md = new MediaQuerySize(context: context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffold_background,
        body: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: (md.getHeight()) * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("My Favourites",
                                  style: displayTextWhiteBold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top:60,bottom: 20,left: 20),
                    child: Text("Favourites/Result",style: displayTextStyle,),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context,index){
                            if(index>6){
                              index=0;
                            }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),

                            child: ListTile(
                              trailing: GestureDetector(
                                  onTap: (){},
                                  child: Icon(Icons.remove_circle,color: Colors.red,)),
                              onTap: (){},
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.teal,
                                child: Image.asset(dummyDataJason[index]["image"],width: 30,),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(dummyDataJason[index]["name"],style: displayTextStyle),
                                  Text(dummyDataJason[index]["Region"],style: inputHintStyle,),
                                  SizedBox(height: 6,)
                                ],
                              ),
                              subtitle: Text(dummyDataJason[index]["Description"]),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
              Positioned(
                top: ((md.getHeight()) * 0.2) - 25,
                width: md.getWidth(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          print("wowo");
                        },
                        child: CustomSearchBar(
                          height: 40,
                          width: 280,
                          hasBorder: true,
                          bgColor: Color(0xFFF8F8F8),
                        )),
                  ],
                ),
              ),
            ],

          ),

        ),
      ),
    );
  }
}
