
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/src/pagina_inicio.dart';

class RestaurantGrid extends StatefulWidget {

  @override
  _RestaurantGridState createState() => _RestaurantGridState();
}

class _RestaurantGridState extends State<RestaurantGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: <Widget>[
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/casadelcafe.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.lightBlueAccent,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/kfc.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.black,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/mcdonalds-app.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.black,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/dunkin-donuts.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.lightBlueAccent,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/tacobell.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.lightBlueAccent,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/dominos-pizza.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.black,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/burger-king-logo.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.black,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {  },
            child: Image.asset('assets/starbucks.png'),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.lightBlueAccent,
          ),
        ]
    );
  }
}