import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/customWidgets/displayCard.dart';
import 'package:oro_recipes/customWidgets/searchBar.dart';
import 'package:oro_recipes/pages/CategoryListPage.dart';
import 'package:oro_recipes/pages/DetailsPage.dart';
import 'package:oro_recipes/pages/Drawer.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/data.dart';
import 'package:oro_recipes/state.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _pageController;
  PageController _pageController2;

  @override
  void initState() {
    super.initState();
    _nightModeState();
    _pageController =
        new PageController(initialPage: 1, viewportFraction: 0.25);
    _pageController2 =
        new PageController(initialPage: 0, viewportFraction: 0.5);
  }

  _nightModeState() async {
//    var _state = Provider.of<SettingsState>(context,listen: false);
//    bool mode = await getModePreference("nightMode");
//    _state.setNightMode(mode);
  }

//  Future<bool> getModePreference(String mode) async{
//    SharedPreferences _prefsMode = await SharedPreferences.getInstance();
//    try{
//    bool nightMode = _prefsMode.getBool(mode);
//    return nightMode;
//    }catch(e){
//      return false;
//    }
//  }

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
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        bottomNavigationBar: CurvedNavigationBar(
          height: 54,
          color: Colors.black,
          backgroundColor:
              !_state.nightMode ? navIndicatorLight : navIndicatorDark,
          buttonBackgroundColor: Colors.red,
          animationDuration: Duration(milliseconds: 100),
          index: 1,
          onTap: (index) {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return pages[index];
            }));
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
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.format_list_bulleted),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Search",
                            style: headingStyle,
                          ),
                          Text(
                            "for recipes",
                            style: heading2Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Consumer<SettingsState>(
                            builder: (context, data, _) => GestureDetector(
                              onTap: () {
//                                List<String> ab=[];
//                                dummyDataJason.forEach((key, value) => ab.add(value["name"].toString()));
//                                print(ab.runtimeType);
                                showSearch(
                                    context: context, delegate: RecipeSearch());
                              },
                              child: CustomSearchBar(
                                width: 260,
                                height: 60,
                                bgColor: data.nightMode
                                    ? searchBgColorDark
                                    : searchBgColorWhite,
                                hasBorder: false,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, top: 15, right: 35, bottom: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFFFD6476),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Go",
                                  style: displayTextWhiteBold,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: dummyDataJason.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return RegionalRecipeList(scrollIndex: index);
                        }));
                      },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex:2,
                            child: CustomCardSmallView(
                              height: 75,
                              width: 75,
                              imgUrl: dummyDataJason[index]["image"],
                            ),
                          ),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(dummyDataJason[index]["Region"]),
                          )),
                        ],
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      "Most Rated",
                      style: displayTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                        controller: _pageController2,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return DetailPage(
                                  itemIndex: index,
                                  offline: false,
                                );
                              }));
                            },
                            child: CustomCardBig(
                              bgColor: _state.nightMode
                                  ? displayCardLight
                                  : displayCardDark,
                              ratingBar: dummyDataJason[index]["Rating"],
                              imgUrl: dummyDataJason[index]["image"],
                              name: dummyDataJason[index]["name"],
                              region: dummyDataJason[index]["Region"],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecipeSearch extends SearchDelegate<String> {
  final recent = ["marqaa", "qamashaa", "lukkuu"];
  List<String> searchable = [];

  RecipeSearch() {
    dummyDataJason.forEach((key, value) {
      searchable.add(value["name"].toString().toLowerCase());
    });
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.backspace),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        FocusScope.of(context).consumeKeyboardToken();
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? recent
        : searchable.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                int id = 0;
                dummyDataJason.forEach((key, value) {
                  if (value["name"].toString().toLowerCase() ==
                      suggestion[index].toString()) {
                    id = key;
                  }
                });
                return DetailPage(
                  itemIndex: id,
                  offline: false,
                );
              }));
            },
            title: RichText(
              text: TextSpan(
                text: suggestion[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestion[index].substring(
                      query.length,
                    ),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
