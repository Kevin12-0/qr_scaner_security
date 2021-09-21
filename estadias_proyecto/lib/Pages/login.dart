import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[100],
      body: ListView(
        children: <Widget>[
          CircleAvatar(
            radius: 100.0,
            backgroundColor:Colors.grey[100],
            backgroundImage: AssetImage('images/img.png'),
          )
        ],
      ),
    );
  }
}
