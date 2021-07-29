import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferencesUser extends StatefulWidget {
  const PreferencesUser({Key? key}) : super(key: key);

  @override
  _PreferencesUserState createState() => _PreferencesUserState();
}

class _PreferencesUserState extends State<PreferencesUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
      ),
      body: Center(
        child: Text("Preferencias aquí"),
      ),
    );
  }
}
