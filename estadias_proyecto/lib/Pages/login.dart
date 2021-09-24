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
            mainAxisAlignment: MainAxisAlignment.center, //centrar los elementos 
            children: [
              // imagen de logo
              CircleAvatar(
                radius: 100.0,
                backgroundColor:Colors.grey[50],
                backgroundImage: AssetImage('images/img.png'),
              ),
              // texto de inico de sesión
              Text(
                'INICIAR SESION',
                style: TextStyle( //estilo
                  fontFamily: 'Linebeam', 
                  fontSize: 25.0 //tamaño
                ),
              ),
              // linea del logo
              SizedBox(
                width:160.0,
                height:15.0,
                child: 
                Divider(
                  color: Colors.grey[900],
                )
              ),
              // text field para el usuario o email
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
              // text field para contraseña
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
                // botton de para iniciar sesion
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
