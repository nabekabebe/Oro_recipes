import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/customWidgets/displayCard.dart';
import 'package:oro_recipes/data.dart';
import 'package:oro_recipes/pages/DetailsPage.dart';
import 'package:oro_recipes/state.dart';
import 'package:provider/provider.dart';

class RegionalRecipeList extends StatefulWidget {

  final int scrollIndex;

  RegionalRecipeList({this.scrollIndex});

  @override
  _RegionalRecipeListState createState() => _RegionalRecipeListState();
}

class _RegionalRecipeListState extends State<RegionalRecipeList> with SingleTickerProviderStateMixin {


  PageController _pageController;
  PageController _pageController2;
  AnimationController _controller;
  int _scrollTo;

  @override
  void initState() {
    super.initState();
    _scrollTo = widget.scrollIndex;
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _pageController =
    new PageController(initialPage: _scrollTo, viewportFraction: 0.5);
    _pageController2 =
    new PageController(initialPage: 0, viewportFraction: 0.65);

    _controller.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var _state = Provider.of<SettingsState>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 54,
          color: Colors.black,
          backgroundColor: !_state.nightMode?navIndicatorLight:navIndicatorDark,
          buttonBackgroundColor: Colors.red,
          animationDuration: Duration(milliseconds: 100),
          index: 2,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
                alignment: Alignment.center,
                child: Text(dummyDataJason[_scrollTo]["Region"].toString()+" Recipes",style: heading2StyleBold,)),
            Expanded(
              flex: 2,
              child: PageView.builder(
                  controller: _pageController2,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(
                              builder: (BuildContext context){
                                return DetailPage(itemIndex: index,offline: false,);
                              }
                          ));
                        },
                        child: CustomCardPageView(
                          ratingBar: dummyDataJason[index]["Rating"],
                          imgUrl: dummyDataJason[index]["image"],
                          name: dummyDataJason[index]["name"],
                          region: dummyDataJason[index]["Region"],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(30),
              child: Text(
                "Regional Category",
                style: displayTextStyle,
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          _pageController2.animateToPage(4, duration: Duration(seconds: 1), curve: Curves.easeIn);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomCardSmallView(
                            height: 140,
                            width: 180,
                            imgUrl: dummyDataJason[index]["image"],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(dummyDataJason[index]["Region"],),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
