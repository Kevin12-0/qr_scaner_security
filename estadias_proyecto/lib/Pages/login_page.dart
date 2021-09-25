import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email;
  TextEditingController _password;

  @override 
  void initState() {
    super.initState();

    _email = TextEditingController();
    _password =  TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
           CircleAvatar(
                radius: 100.0,
                backgroundColor:Colors.grey[50],
                backgroundImage: AssetImage('images/img.png'),
              ),
          TextField(
            controller: _email,
            decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                suffixIcon:Icon(
                Icons.verified_user
                )
            )
          ),
          TextField(
            controller: _password,
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
          ElevatedButton(
            child: Text('Iniciar Sesión'),
            onPressed: _login
          )
        ]
      ),
    );
  }

  Future _login() async {
    await Injector.appInstance.get<SupabaseClient>().auth.signIn(
      email: _email.text,
      password: _password.text
    );

  }
}