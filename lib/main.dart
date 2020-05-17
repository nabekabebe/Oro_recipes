import 'package:flutter/material.dart';
import 'package:oro_recipes/pages/HomePage.dart';
import 'package:oro_recipes/state.dart';
import 'package:provider/provider.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>SettingsState(),
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsState>(
      builder: (context,state,_)=>
      MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: state.nightMode?ThemeData.dark():ThemeData.light(),
        home: Home(),
      ),
    );
  }
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
