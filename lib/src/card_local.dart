import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/src/locales.dart';
import 'package:vaint_service/src/restaurant.dart';
import 'package:vaint_service/src/pagina_inicio.dart';

// ignore: must_be_immutable
class CardLocal extends StatelessWidget {
  Local local;
  static String tittle = "";
  CardLocal(this.local);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          tittle = local.nombre;
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new BeginPage();
          }));
        },
        child: Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                padding(Icon(Icons.restaurant)),
                padding(Text(local.nombre,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)))
              ]),
              Container(
                height: 144,
                width: 500,
                color: local.color,
                child: Image.asset(local.image, height: 144, width: 160),
              )
            ],
          ),
        ));
  }

  Widget padding(Widget widget) {
    return Padding(padding: EdgeInsets.all(7.0), child: widget);
  }
}
