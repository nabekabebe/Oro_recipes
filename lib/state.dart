import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference{

}

enum Language{
  English,Oromo
}


class SettingsState with ChangeNotifier{

  bool nightMode=false;
  Language language=Language.English;


  setNightMode(bool val){
    nightMode=val;
    notifyListeners();
  }
  setLanguage(Language lan){
    language=lan;
    notifyListeners();
  }

}


class FavCollection{

  static List<int> favorites = [];

  favSet(int index){
    if(!favorites.contains(index)){
      favorites.insert(0,index);
    }

  }

  List favGet(){
    return favorites;
  }

  int itemGet(){
    return favorites.length;
  }

  favRemove(int index){
    favorites.removeAt(index);
  }

}


