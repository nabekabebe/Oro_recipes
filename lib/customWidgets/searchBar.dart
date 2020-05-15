import 'package:flutter/material.dart';


class CustomSearchBar extends StatelessWidget {

  final double height;
  final double width;
  final Color bgColor;
  final bool hasBorder;

  CustomSearchBar({this.height,this.width,this.bgColor,this.hasBorder});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: hasBorder ? Border.all(width: 1):null,
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(width/2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 15,),
          Icon(Icons.search),
          SizedBox(width: 20,),
          Text("dish name"),
        ],
      )
    );
  }
}
