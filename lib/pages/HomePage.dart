import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/customWidgets/displayCard.dart';
import 'package:oro_recipes/customWidgets/searchBar.dart';
import 'package:oro_recipes/pages/CategoryListPage.dart';
import 'package:oro_recipes/pages/DetailsPage.dart';
import 'package:oro_recipes/pages/Drawer.dart';
import 'package:oro_recipes/pages/FavoritesPage.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/data.dart';


class HomePage extends StatefulWidget {

  final data=dummyDataJason;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _pageController;
  PageController _pageController2;
  StreamManager _streamManager = new StreamManager();


  @override
  void initState() {
    super.initState();
    _pageController =
        new PageController(initialPage: 1, viewportFraction: 0.25);
    _pageController2 =
        new PageController(initialPage: 0, viewportFraction: 0.5);
  }


  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        backgroundColor: scaffold_background,
        bottomNavigationBar: CurvedNavigationBar(
          height: 56,
          color: Color(0xFF0B8457),
          backgroundColor: scaffold_background,
          buttonBackgroundColor: Colors.red,
          animationDuration: Duration(milliseconds: 150),
          items: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(
                    builder: (BuildContext context){
                      return RegionalRecipeList();
                    }
                ));
              },
              child: Icon(
                Icons.category,
                color: Colors.white,
                size: 26,
              ),
            ),
            Icon(
              Icons.home,
              color: Colors.white,
              size: 26,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(
                    builder: (BuildContext context){
                      return FavoritesPage();
                    }
                ));
              },
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 26,
              ),
            ),
          ],
          index: 1,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                       _scaffoldKey.currentState.openDrawer();
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(right: 20,bottom: 8),
                        child: Icon(Icons.format_list_bulleted),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text("Search",style: headingStyle,),
                          Text("for recipes",style: heading2Style,),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomSearchBar(
                            width: 260,
                            height: 60,
                            bgColor: Color(0xFFefefef),
                            hasBorder: false,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,top: 15,right: 35,bottom: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFFFD6476),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: Text("Go",style:displayTextWhiteBold,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: PageView.builder(
                          controller: _pageController,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(
                                      builder: (BuildContext context){
                                        return RegionalRecipeList(scrollIndex: index);
                                      }
                                  ));
                                },
                                child: Column(
                                  children: <Widget>[
                                    CustomCardSmall(
                                      isCircle: false,
                                      imgUrl: dummyDataJason[index]["image"],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(dummyDataJason[index]["Region"]),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20,bottom: 20),
                      child: Text(
                        "Most Rated",
                        style: displayTextStyle,
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<List>>(
                        stream: _streamManager.allList,
                        builder: (context,snapshot){
                          List<List> rr=snapshot.data;
                          print(rr);
                          return PageView.builder(
                              controller: _pageController2,
                              itemCount: 0,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(
                                        builder: (BuildContext context){
                                          return DetailPage(itemIndex: index,);
                                        }
                                    ));
                                  },
                                  child: CustomCardBig(
                                    ratingBar: dummyDataJason[0]["Rating"],
                                    imgUrl: dummyDataJason[0]["image"],
                                    name: dummyDataJason[0]["name"],
                                    region: dummyDataJason[0]["Region"],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


