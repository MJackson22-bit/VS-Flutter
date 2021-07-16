
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensor Flow',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenidos a la App de Vaint Service'),
        actions: [
          IconButton(onPressed: _beginSession,icon: Icon(Icons.login), tooltip: 'Iniciar Sesión'),
          IconButton(onPressed: _registerSession,icon: Icon(Icons.app_registration_sharp),  tooltip: 'Registrarse'),
        ],
      ),
      body: Card(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/Vs.png'),
              MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: (){
                  _beginSession();
                },
                color: Colors.lightBlue,
                child: Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
              ),
              Container(
                margin: EdgeInsets.all(50.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () {
                    _registerSession();
                  },
                  color: Colors.lightBlue,
                  child: Text('Registrarse',
                      style: TextStyle(color: Colors.white)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  void _beginSession() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context){
              return Scaffold(
                appBar: AppBar(
                  title: Text('Iniciando Sesión'),
                ),
                body: _LoginForm()
              );
            }
        )
    );
  }

  void _registerSession() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context){
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Registrándose'),
                  ),
                  body: _RegisterForm()
              );
            }
        )
    );
  }
}
class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: <Widget>[
            Image.asset('assets/Vs.png'),
            Container(
              child: Text("Nombre de Usuario"),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 15, top: 1),
                        child: TextFormField(
                          cursorColor: Colors.black26,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Por favor ingrese su nombre de usuario";
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )
                        )
                    )
                )
            ),
            Container(
              child: Text("Contraseña"),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 15, top: 1),
                        child: TextFormField(
                            obscureText: true,
                            cursorColor: Colors.black26,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Por favor ingrese su contraseña";
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                            )
                        )
                    )
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));

                  }
                },
                child: Text('Entrar'),
              ),
            ),
          ],
        ),
    );
  }
}
class _RegisterForm extends StatefulWidget{
  @override
  __RegisterFormState createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Image.asset('assets/Vs.png'),
          Container(
            child: Text("Nombre de Usuario"),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 15, top: 1),
                      child: TextFormField(
                          cursorColor: Colors.black26,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Por favor ingrese su nombre de usuario";
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              icon: Icon(Icons.person)
                          )
                      )
                  )
              )
          ),
          Container(
            child: Text("Correo Electrónico"),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 15, top: 1),
                      child: TextFormField(
                          cursorColor: Colors.black26,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Por favor ingrese su correo electrónico";
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              icon: Icon(Icons.email)
                          )
                      )
                  )
              )
          ),
          Container(
            child: Text("Contraseña"),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 15, top: 1),
                      child: TextFormField(

                          cursorColor: Colors.black26,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Por favor ingrese su contraseña";
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.password)
                          )
                      )
                  )
              )
          ),
          Container(
            child: Text("Confirmar Contraseña"),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 15, top: 1),
                      child: TextFormField(
                        obscureText: true,
                          cursorColor: Colors.black26,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Por favor confirme su contraseña";
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              icon: Icon(Icons.password)
                          )
                      )
                  )
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context){
                            return Scaffold(
                                appBar: AppBar(
                                  title: Text('Iniciando Sesión'),
                                ),
                                body: _LoginForm()
                            );
                          }
                      )
                  );
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Registro Exitoso')));
                }
              },
              child: Text('Registrarse'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Terminos extends StatefulWidget {
  const _Terminos({Key? key}) : super(key: key);

  @override
  __TerminosState createState() => __TerminosState();
}

class __TerminosState extends State<_Terminos> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

