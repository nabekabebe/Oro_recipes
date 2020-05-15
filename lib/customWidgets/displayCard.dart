import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomCardSmall extends StatelessWidget {
  final bool isCircle;
  final String imgUrl;

  CustomCardSmall({this.imgUrl, this.isCircle});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        imgUrl,
        height: 60,
        width: 60,
      ),
    );
  }
}




class CustomCardSmallView extends StatelessWidget {
  final bool isCircle;
  final String imgUrl;

  CustomCardSmallView({this.imgUrl, this.isCircle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgUrl),fit: BoxFit.cover
          ),
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.grey,
                offset: Offset(3,4)
            ),
          ]),
      alignment: Alignment.center,
    );
  }
}






class CustomCardBig extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String ratingBar;
  final String region;

  CustomCardBig({this.imgUrl, this.name, this.ratingBar,this.region});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50),
          alignment: Alignment.topCenter,
          width: 180,
          height: 260,
          decoration: BoxDecoration(
              color: Color(0xFFf4c989),
              borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow:[
              BoxShadow(
              blurRadius: 1,
              color: Colors.grey,
              offset: Offset(1,2)
          ),
        ]),
          child: Image.asset(
            imgUrl,
            height: 80,
            width: 80,
          ),
        ),
        Positioned(
          bottom: 50,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              Text(region,style:TextStyle(fontSize: 12)),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)

                      ),
                    ),
                    child: RatingBar(
                      itemSize: 16,
                      initialRating: double.parse(ratingBar),
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
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.add_box)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class CustomCardPageView extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String ratingBar;
  final String region;

  CustomCardPageView({this.imgUrl, this.name, this.ratingBar,this.region});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgUrl),fit: BoxFit.cover
            ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow:[
                BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey,
                    offset: Offset(1,2)
                ),
              ]),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
              Text(region,style:TextStyle(fontSize: 13,color: Colors.white,)),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ],
    );
  }
}
