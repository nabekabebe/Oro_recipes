import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/data.dart';

class DetailPage extends StatefulWidget {

  final int itemIndex;
  DetailPage({this.itemIndex});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {

  FavouritesCollection _favouritesCollection = new FavouritesCollection();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  int itemSelected;
  bool isLiked = false;
  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    itemSelected=widget.itemIndex;
    _tabController=TabController(length: 1,vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.6);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  _initSnackBar(String msg) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(msg)));
  }

  _likeAction() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {

    MediaQuerySize md = MediaQuerySize(context: context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: scaffold_background,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                    Navigator.pop(context);
                },
              ),
              elevation: 5.0,
              centerTitle: true,
              floating: true,
              bottom: TabBar(
                indicatorColor: Colors.transparent,
                controller: _tabController,
                tabs: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        _likeAction();
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isLiked?Colors.pink:Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              expandedHeight: md.getHeight()/2-70,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(dummyDataJason[itemSelected]["image"],fit: BoxFit.cover,)
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(dummyDataJason[itemSelected]["name"], style: heading2StyleBold,),
                          SizedBox(height: 3,),
                          Row(
                            children: <Widget>[
                              RatingBar(
                                itemSize: 14,
                                initialRating: double.parse(dummyDataJason[itemSelected]["Rating"]),
                                ignoreGestures: false,
                                direction: Axis.horizontal,
                                unratedColor: Colors.grey,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(width: 5,),
                              Text("("+dummyDataJason[itemSelected]["Rating"]+" rating)",style: smallText,)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(dummyDataJason[itemSelected]["Likes"],style: TextStyle(fontSize: 12),),
                              SizedBox(width: 15,),
                              Text(dummyDataJason[itemSelected]["DisLike"],style: TextStyle(fontSize: 12),),

                            ],
                          ),
                          SizedBox(height: 3,),
                          Row(
                            children: <Widget>[
                              Icon(Icons.thumb_up,color: Colors.grey,size: 15,),
                              SizedBox(width: 20,),
                              Icon(Icons.thumb_down,color: Colors.grey,size: 15,)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Ingredients",
                        style: displayTextStyle,
                      ),
                  GestureDetector(
                    onTap: (){
                      _favouritesCollection.favorites.add(itemSelected);
                      _initSnackBar("Item added to favourites!");
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30)
                        ),
                      ),
                      child: Text("Add to Fav",style: TextStyle(fontSize: 10,color: Colors.white),),
                    ),
                  ),
                    ],
                  ),
                ),
                Container(
                  color: scaffold_background,
                  height: 100,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        List ingredientsList=dummyDataJason[itemSelected]["ingredients"];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(dummyDataJason[index]["image"]),
                              radius: 30,
                            ),
                            title: Text(ingredientsList[index]["name"],style: displayTextStyle,),
                            subtitle: Text("Amount: "+ingredientsList[index]["quantity"],style: smallText,),
                          ),
                        );
                      }),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  title: Text("Description", style: displayTextStyle,),
                  subtitle: Text(dummyDataJason[itemSelected]["Description"],style: smallText,),
                  onTap: null,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Recipe Steps", style: displayTextStyle),
                ),
              ]),
            ),
            SliverList(
                delegate: SliverChildListDelegate(List.generate(2, (index) {
                  List<String> one = dummyDataJason[itemSelected]["steps"];
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Card(
                  child: ListTile(
                    title: Text("Step "+(index+1).toString(),),
                    onTap: null,
                    subtitle: Text(one[index]),
                  ),
                ),
              );
            }))),
          ],
        ),
      ),
    );
  }
}
