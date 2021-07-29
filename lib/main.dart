import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vaint_service/ui_user/login_user.dart';
import 'package:vaint_service/ui_user/user_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tensor Flow',
      home: Home(),
      routes: {
        // Cuando naveguemos hacia la ruta "/", crearemos el Widget FirstScreen
        '/login': (context) => MyApp(),
      },
    );
  }
}
