import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[50],
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
                backgroundColor:Colors.grey[50],
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
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  suffixIcon:Icon(
                      Icons.verified_user
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),             
              ),
              SizedBox(
                width: 10.0,
                height:15.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon:Icon(
                    Icons.lock_outline
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )
                ),
              ),
              Divider(
                height: 15.0,
              ),
              SizedBox(
                child: 
                FlatButton(
                  hoverColor: Colors.cyan,
                  onPressed: (){},
                  child: const Text('INICIAR'),
                  color: Colors.cyan[600],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
