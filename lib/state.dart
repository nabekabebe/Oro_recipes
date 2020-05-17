import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Language{
  English,Oromo
}


class SettingsState with ChangeNotifier{

  bool nightMode=false;
  Language language=Language.English;

  Future<bool> setModePrefernce(bool mode) async{
    SharedPreferences _prefsMode = await SharedPreferences.getInstance();
    _prefsMode.clear();
    _prefsMode.setBool("nightMode", mode).then((value) =>  notifyListeners());
  }

  setNightMode(bool val) async{
    nightMode=val;
    await setNightMode(val);
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


