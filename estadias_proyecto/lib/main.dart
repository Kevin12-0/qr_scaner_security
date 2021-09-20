import 'package:flutter/material.dart';
import 'Pages/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      routes: <String, WidgetBuilder>{
        'login':(BuildContext context) => LoginPage(),
      }
    );
  }
}