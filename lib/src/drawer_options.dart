import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/src/restaurant.dart';
import 'package:vaint_service/src/pagina_inicio.dart';
import 'package:vaint_service/src/business.dart';
class DrawerPage extends StatefulWidget {
  static String id = "drawer_options";
  static final String tittle = "Lista de Restaurantes";
  @override
  __DrawerPageState createState() => __DrawerPageState();
}

class __DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BusinessPage(),//RestaurantGrid(),
        appBar: AppBar(title: Text("Lista de Restaurantes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic
          ),
        ),
          actions: [
            IconButton(
                icon: Icon(Icons.assistant_photo_outlined),
                tooltip: 'Guía Rápida', onPressed: () {
                  BeginPage();
            },),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('assets/Vs.png'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 15.0),
              ListTile(
                title: Text("Perfil",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  )
                ),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15.0),
              ListTile(
                title: Text("Preferencias",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    )
                ),
                leading: Icon(Icons.admin_panel_settings),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15.0),
              ListTile(
                title: Text("Acerca de...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    )
                ),
                leading: Icon(Icons.info),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15.0),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Cerrar Sesión",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    )
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}

