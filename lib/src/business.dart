import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/src/locales.dart';
import 'package:vaint_service/src/card_local.dart';

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  List<Local> locales = Local.locales();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: locales.length,
        itemBuilder: (BuildContext context, int index) {
      return Dismissible(
          key: ObjectKey(locales[index]), child: CardLocal(locales[index]));
    });
  }
}
