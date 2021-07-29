import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/db/user_database.dart';
import 'package:vaint_service/model/user.dart';

import 'package:vaint_service/src/drawer_options.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  late List<User> users;
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    nameController.dispose();
    passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicia Sesión"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.0),
            Flexible(
              child: Image.asset('assets/Vs.png'),
            ),
            SizedBox(height: 15.0),
            Flexible(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black26,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Nombre de Usuario",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          icon: Icon(Icons.person)))),
            ),
            SizedBox(height: 20.0),
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black26,
                      obscureText: true,
                      controller: passwdController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: "Contraseña",
                          icon: Icon(Icons.lock)))),
            ),
            SizedBox(
              height: 70.0,
            ),
            RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                child: Text("Iniciar Sesión",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10.0,
              color: Colors.lightBlueAccent,
              textColor: Colors.black,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final r = await verifyUser();
                  if (r) {
                    await Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                      return new DrawerPage();
                    }), (Route<dynamic> route) => false);
                  } else {
                    return showDialog(
                      context: context,
                      barrierColor: Colors.black,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.blue,
                          // Recupera el texto que el usuario ha digitado utilizando nuestro
                          // TextEditingController
                          content: Text("¡Usuario y/o contraseña incorrecta!"),
                          title: Text("No encontrado"),
                          actions: <Widget>[
                            RaisedButton(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 15.0),
                                child: Text("CERRAR",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black)),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 10.0,
                              color: Colors.lightBlueAccent,
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> verifyUser() async {
    this.users = await UserDatabase.instance.readUsers();
    for (int i = 0; i < users.length; i++) {
      final user = users[i];
      if (nameController.text == user.nombre &&
          passwdController.text == user.passwd) {
        return true;
      }
    }
    return false;
  }
}
