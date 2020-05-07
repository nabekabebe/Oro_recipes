import 'package:flutter/material.dart';



class OutlinedButton extends StatelessWidget {
  final Color borderColor;
  final Function onTapped;
  final String name;

  OutlinedButton({this.borderColor,this.onTapped,this.name});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:20.0),
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1.6,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(name,style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w500
        ),),

      ),
    );
  }
}
