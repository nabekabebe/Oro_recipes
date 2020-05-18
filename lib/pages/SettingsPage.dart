import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/constants.dart';
import 'package:provider/provider.dart';
import '../state.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Language _character = Language.English;
  String message = "Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog. Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog. Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.";



  _initSnackBar(String msg) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(msg)));
  }

  _sendFeedback() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(labelText: 'Share your idea'),
                ),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('SEND'),
                onPressed: () {
                  Navigator.pop(context);
                  _initSnackBar("Thans For Your Ideas");
                })
          ],
        );
      },
    );
  }

  _showPrivacyInfo() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(10.0),
          content: SingleChildScrollView(child: Text(message)),
          actions: <Widget>[
            FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }

//  _setMode(bool val,BuildContext c){
//    var _state = Provider.of<SettingsState>(c,listen: false);
//    _state.setNightMode(val);
//  }


  @override
  Widget build(BuildContext context) {
    var state = Provider.of<SettingsState>(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Setting",style: displayTextWhiteBold,),),
        body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30,),
              Container(
                  child: SwitchListTile(
                    activeColor: Colors.teal,
                    value: state.nightMode,
                    onChanged: (f) {
                      state.setNightMode(f);
                    },
                    title: Text("Night mode"),
                  )),
              ExpansionTile(
                children: <Widget>[
                  ListTile(
                    title: const Text('English'),
                    leading: Radio(
                      value: Language.English,
                      groupValue: _character,
                      onChanged: (Language value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Afaan Oromo || This is not yet Supported'),
                    leading: Radio(
                      value: Language.Oromo,
                      groupValue: _character,
                      onChanged: (Language value) {
//                        setState(() {
//                          _character = value;
//                        });
                      },
                    ),
                  ),
                ],
                title: Text("Language"),
              ),
              InkWell(
                onTap: _showPrivacyInfo,
                child: ListTile(
                  title: Text("Privacy and Policy"),
                ),
              ),
              InkWell(
                onTap: _sendFeedback,
                child:ListTile(
                  title: Text("Support and Feedback"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
