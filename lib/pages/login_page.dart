import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/constants.dart';
import 'package:oro_recipes/customWidgets/outlinedButton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {

    MediaQuerySize md=new MediaQuerySize(context: context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
                child: Center(
                    child: Image.asset('images/abba_gada.png',width:md.getWidth()-50),
                )
            ,),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom:30.0),
                        child: Text("Login",style: headingStyle,),
                      ),
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Email Address'),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter email or phone number",hintStyle: TextStyle(fontSize: 11),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Password'),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your password",hintStyle: TextStyle(fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          RichText(
                            text:TextSpan(
                                text:"Forget your password?",
                                style: richTextStyle,
                            ),
                          ),
                          SizedBox(height: 25.0,),
                          OutlinedButton(
                            name: "Login",
                            onTapped: (){},
                            borderColor: Colors.black,
                          ),
                          SizedBox(height: 35.0,),
                          RichText(
                            text:TextSpan(
                                text:"Don't have an account? ",
                            style: displayTextStyle,
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "Sign Up",
                                  style: richTextStyle,
                                ),

                              ]
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}
