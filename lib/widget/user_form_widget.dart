import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/ui_user/login_user.dart';

class UserFormWidget extends StatelessWidget {
  final String? nombre;
  final String? correo;
  final String? passwd;
  final ValueChanged<String> onChangedNombre;
  final ValueChanged<String> onChangedCorreo;
  final ValueChanged<String> onChangedPasswd;


  const UserFormWidget({
    Key? key,
    this.nombre ='',
    this.correo = '',
    this.passwd = '',
    required this.onChangedNombre,
    required this.onChangedCorreo,
    required this.onChangedPasswd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  validator: (nombre) =>
                  nombre != null && nombre.isEmpty ? '' : null,
                  onChanged: onChangedNombre,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
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
                  validator: (correo) =>
                  correo != null && correo.isEmpty ? '' : null,
                  onChanged: onChangedCorreo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
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
                  validator: (passwd) =>
                  passwd != null && passwd.isEmpty ? '' : null,
                  onChanged: onChangedCorreo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
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
                  validator: (passwd) =>
                  passwd != null && passwd.isEmpty ? '' : null,
                  onChanged: onChangedPasswd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelText: "Confirme su contraseña",
                      icon: Icon(Icons.lock)))),
        ),
      ],
    );
  }
}
/* child: Column(
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
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
                          body: LoginForm());
                    }));
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Registro Exitoso')));
              }
            },
          ),
        ],
      ),*/