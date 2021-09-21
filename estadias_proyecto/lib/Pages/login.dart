import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor:Colors.grey,
                backgroundImage: AssetImage('images/img.png'),
              ),
              Text(
                'INICIAR SESION',
                style: TextStyle(
                  fontFamily: 'Linebeam',
                  fontSize: 25.0
                ),
              ),
              SizedBox(
                width:160.0,
                height:15.0,
                child: 
                Divider(
                  color: Colors.grey[900],
                )
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
