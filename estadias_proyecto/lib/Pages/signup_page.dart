import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _confirmpassword;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        children: [
          CircleAvatar(
            radius: 100.0,
            backgroundColor: Colors.grey[50],
            backgroundImage: AssetImage('images/img.png'),
          ),
          TextFormField(
              controller: _email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Inserte un email correcto';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.verified_user))),
          TextFormField(
              controller: _password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Inserte una contraseña valida';
                }
                return null;
              },
              enableInteractiveSelection: false,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ))),
          TextFormField(
            controller: _confirmpassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Inserte una contraseña valida';
              // ignore: missing_return
              }
              // ignore: missing_return
              if (value != _password.text) {
                return 'Contraseña invalida';
              }
              return null;
            },
            enableInteractiveSelection: false,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Confirm Password',
                labelText: 'Confirm Password',
                suffixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
          ),
          ElevatedButton(
            child: Text('Sing Up'),
            onPressed: _signup,
          )
        ],
      ),
    ));
  }

  Future _signup() async {
    if (_formKey.currentState.validate()){

    }
  }
}
