import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

import 'data_saw.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();
    final supabaseClient = Injector.appInstance.get<SupabaseClient>();
    final user = supabaseClient.auth.user();

    // redireccion al login
    if (user == null) {
      
    }else{
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => DataSaw()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CircularProgressIndicator(),
      ),
    );

  }
}