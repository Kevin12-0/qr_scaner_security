import 'package:datos_qr/pages/HomePage.dart';
import 'package:datos_qr/pages/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';

import 'SiginUp.dart';

class LoginPage extends StatefulWidget {
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
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 90.0,
          ),
          children: [
            CircleAvatar(
              radius: 100.0,
              backgroundColor: Colors.grey[50],
              backgroundImage: AssetImage('images/img.png'),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)))),
            SizedBox(
              width: 20,
              height: 15,
            ),
            TextField(
              controller: _password,
              enableInteractiveSelection: false,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
            ElevatedButton(child: Text('Iniciar Sesión'), onPressed: _login),
            Divider(
              thickness: 2,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SiginUpPage()));
                },
                child: Text('Registrate')),
          ]),
    ));
  }

  Future _login() async {
    final signInResult = await Injector.appInstance
        .get<SupabaseClient>()
        .auth
        .signIn(email: _email.text, password: _password.text);
    if (signInResult != null && signInResult.user != null) {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(
          persistentSessionKey, signInResult.data.persistSessionString);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (signInResult.error.message != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(signInResult.error.message)));
    }
  }
}
