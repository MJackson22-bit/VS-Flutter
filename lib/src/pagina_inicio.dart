
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vaint_service/src/drawer_options.dart';
import 'package:vaint_service/src/restaurant.dart';
import 'package:vaint_service/src/card_local.dart';

class BeginPage extends StatefulWidget {
  static String id = "pagina_inicio";
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensor Flow',
      // routes: <String, WidgetBuilder>{
      //   '/pagina_inicio': (BuildContext context) => new _
      // },
      home: DrawerPage(),
    );
  }
  @override
  __BeginPageState createState() => __BeginPageState();
}

class __BeginPageState extends State<BeginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CardLocal.tittle),
      ),
      body: RestaurantGrid(),
    );
  }
}
class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget> [
            Container(
             height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(9, 9),
                    blurRadius: 6
                  )
                ]
              ),
              alignment: Alignment.center,
              child: Text("Lista de Restaurantes Disponibles",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight:  FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
