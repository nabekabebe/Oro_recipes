import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oro_recipes/constants.dart';

enum Language { English, Afaan_Oromo }

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Language _character = Language.English;
  String message =
      "Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog. Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog. Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.Aw a dialog. You must provide the shoThis itemBuilder function must return an object of type Dialog.";
  double rating = 2.5;


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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: scaffold_background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.centerLeft,
              color: Colors.black,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Settings",
                          style: displayWhiteTextStyle,
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Container(
                      child: SwitchListTile(
                        activeColor: Colors.teal,
                        onChanged: (f) {},
                        value: false,
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
                        title: const Text('Afaan Oromo'),
                        leading: Radio(
                          value: Language.Afaan_Oromo,
                          groupValue: _character,
                          onChanged: (Language value) {
                            setState(() {
                              _character = value;
                            });
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
          ],
        ),
      ),
    );
  }
}
