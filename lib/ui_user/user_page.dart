
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/db/user_database.dart';
import 'package:vaint_service/model/user.dart';
import 'package:vaint_service/ui_user/register_user.dart';

import 'login_user.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  bool isLoading = false;
  late List<User> users;
  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    UserDatabase.instance.close();
    super.dispose();
  }

  void refreshNotes() async {
    setState(() => isLoading = true);
    this.users = await UserDatabase.instance.readUsers();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenidos a la App de Vaint Service',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginForm()),
                );
                refreshNotes();
              },
              icon: Icon(Icons.login),
              tooltip: 'Iniciar Sesión'),
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterForm()),
                );
                refreshNotes();
              },
              icon: Icon(Icons.app_registration_sharp),
              tooltip: 'Registrarse'),
        ],
      ),
      body: Card(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 70.0),
              Flexible(child: Image.asset('assets/Vs.png')),
              SizedBox(height: 70.0),
              Flexible(
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 40.0,
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginForm()),
                      );
                      refreshNotes();
                    },
                    color: Colors.lightBlue,
                    child: Text('Iniciar Sesión',
                        style: TextStyle(color: Colors.white)),
                  )),
              Flexible(
                child: Container(
                  margin: EdgeInsets.all(50.0),
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 40.0,
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterForm()),
                      );
                    },
                    color: Colors.black,
                    child: Text('Registrarse',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : users.isEmpty ? Text(
                    "No users",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24
                    )
                )
                    : buildUsers(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUsers() {
    return Text(users.length.toString());
  }
}
