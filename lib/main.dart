import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/src/pagina_inicio.dart';
import 'package:vaint_service/src/drawer_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensor Flow',
      // routes: <String, WidgetBuilder>{
      //   '/pagina_inicio': (BuildContext context) => new _
      // },
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
        title:
        Text('Bienvenidos a la App de Vaint Service',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: [
          IconButton(
              onPressed: _beginSession,
              icon: Icon(Icons.login),
              tooltip: 'Iniciar Sesión'),
          IconButton(
              onPressed: _registerSession,
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
              Flexible(
                  child: MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: () {
                  _beginSession();
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
                    onPressed: () {
                      _registerSession();
                    },
                    color: Colors.lightBlue,
                    child: Text('Registrarse',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _beginSession() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Iniciando Sesión'),
          ),
          body: _LoginForm());
    }));
  }

  void _registerSession() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Registrándose'),
          ),
          body: _RegisterForm());
    }));
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
          SizedBox(height: 70.0),
          Flexible(
            child: Image.asset('assets/Vs.png'),
          ),
          SizedBox(height: 15.0),
          Flexible(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black26,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Nombre de Usuario",
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        labelText: "Contraseña", icon: Icon(Icons.lock)))),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.lightBlueAccent,
            textColor: Colors.black,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Registro Exitoso')));
                Navigator.of(context).push(MaterialPageRoute<Null>(
                  builder: (BuildContext context){
                    return new DrawerPage();
                  }
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Image.asset('assets/Vs.png'),
          ),
          SizedBox(
            height: 15.0,
          ),
          Flexible(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black26,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Nombre de Usuario",
                        icon: Icon(Icons.person)))),
          ),
          SizedBox(
            height: 14.0,
          ),
          Flexible(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black26,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Correo Electrónico",
                        icon: Icon(Icons.email)))),
          ),
          SizedBox(
            height: 20.0,
          ),
          Flexible(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black26,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        labelText: "Contraseña", icon: Icon(Icons.lock)))),
          ),
          SizedBox(
            height: 20.0,
          ),
          Flexible(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                  obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.black26,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        labelText: "Confirme su contraseña",
                        icon: Icon(Icons.lock)))),
          ),
          SizedBox(
            height: 30.0,
          ),
          RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              child: Text("Registrarse",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black)),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10.0,
            color: Colors.lightBlueAccent,
            textColor: Colors.black,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Scaffold(
                      appBar: AppBar(
                        title: Text('Registrarse'),
                      ),
                      body: _LoginForm());
                }));
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Registro Exitoso')));
              }
            },
          ),
        ],
      ),
    );
  }
}
