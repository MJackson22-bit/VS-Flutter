import 'package:vaint_service/db/user_database.dart';
import 'package:vaint_service/ui_user/login_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaint_service/model/user.dart';
import 'package:flutter/material.dart';
import 'package:vaint_service/widget/user_form_widget.dart';

class RegisterForm extends StatefulWidget {
  final User? user;
  const RegisterForm({Key? key, this.user}) : super(key: key);
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String nombre;
  late String correo;
  late String passwd;
  @override
  void initState(){
    super.initState();
    nombre = widget.user?.nombre ?? '';
    correo = widget.user?.correo ?? '';
    passwd = widget.user?.passwd ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildButton()],
      ),
     body: Form(
       key: _formKey,
       child: UserFormWidget(
         nombre: nombre,
         correo: correo,
         passwd: passwd,
         onChangedNombre: (nombre) => setState(() => this.nombre = nombre),
         onChangedCorreo: (correo) => setState(() => this.correo = correo),
         onChangedPasswd: (passwd) => setState(() => this.passwd = passwd),
       ),
     ),
    );
  }

  Widget buildButton() {
    final isFormValid = nombre.isNotEmpty && correo.isNotEmpty && passwd.isNotEmpty;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8, horizontal: 12
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: isFormValid ? null : Colors.grey,
        ),
        onPressed: addOrUpdateUser,
        child: Text("Registrarse"),
      ),
    );
  }
  void addOrUpdateUser() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.user != null;
      await addUser();
      Navigator.of(context).pop();
    }
  }
  Future addUser() async{
    final user = User(
        nombre: nombre,
        correo: correo,
        passwd: passwd
    );
    await UserDatabase.instance.create(user);
  }
}
