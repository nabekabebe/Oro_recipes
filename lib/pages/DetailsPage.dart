import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/data.dart';
import 'package:provider/provider.dart';
import '../state.dart';

class DetailPage extends StatefulWidget {

  final int itemIndex;
  final bool offline;
  DetailPage({this.itemIndex,this.offline});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FavCollection _favCollection = new FavCollection();


  int itemSelected;
  bool isLiked = false;
  PageController _pageController;
  TabController _tabController;
  List<String> one=[];

  @override
  void initState() {
    // TODO: implement initState
    itemSelected=widget.itemIndex;
    one = dummyDataJason[itemSelected]["steps"];
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


  Color saved=Colors.grey;


  @override
  Widget build(BuildContext context) {

    var _offlineState = Provider.of<SettingsState>(context);

    MediaQuerySize md = MediaQuerySize(context: context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              elevation: 5.0,
              centerTitle: true,
              floating: true,
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
                            children: [
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
                              Text("("+dummyDataJason[itemSelected]["Rating"]+" rating)",style: smallText,),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _favCollection.favSet(itemSelected);
                            _initSnackBar("Item added to favourites!");
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 16),
                  child: Text(
                    "Ingredients",
                  ),
                ),
                Container(
                  height: 100,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        List ingredientsList=dummyDataJason[itemSelected]["ingredients"];
                        return Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(top: 5,left: 10),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(dummyDataJason[index]["image"]),
                              radius: 30,
                            ),
                            title: Text(ingredientsList[index]["name"]),
                            subtitle: Text("Amount: "+ingredientsList[index]["quantity"]),
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
                delegate: SliverChildListDelegate(List.generate(one.length, (index) {
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
