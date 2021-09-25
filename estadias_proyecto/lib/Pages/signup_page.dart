import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _confirmpassword;

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
      body: Column(
        children: [
          CircleAvatar(
            radius: 100.0,
            backgroundColor: Colors.grey[50],
            backgroundImage: AssetImage('images/img.png'),
          ),
          TextField(
              controller: _email,
              decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.verified_user))),
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
                  ))),
          TextField(
            controller: _confirmpassword,
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
        ],
      ),
    );
  }
}

