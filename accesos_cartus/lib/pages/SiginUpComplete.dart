import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class SiginUpComplete extends StatefulWidget {
  SiginUpComplete({Key key}) : super(key: key);

  @override
  _SiginUpCompleteState createState() => _SiginUpCompleteState();
}

class _SiginUpCompleteState extends State<SiginUpComplete> {
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
        appBar: AppBar(title: const Text('Registro')),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 20,
                height: 20,
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
                      suffixIcon: Icon(Icons.verified_user),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
              SizedBox(
                width: 20,
                height: 20,
              ),
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
              SizedBox(
                width: 20,
                height: 20,
              ),
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
    if (_formKey.currentState.validate()) {
      await Injector.appInstance
          .get<SupabaseClient>()
          .auth
          .signUp(_email.text, _password.text);
    }
  }
}
