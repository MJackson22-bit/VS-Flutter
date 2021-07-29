import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca de Vaint Service"),
      ),
      body: Center(
        child: Text("Acerca de la aplicación aquí"),
      ),
    );
  }
}
