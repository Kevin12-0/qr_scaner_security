import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';

import 'home_page.dart';
import 'login_page.dart';

const persistentSessionKey = 'persistentSessionKey';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    authentication();
  }
   Future <void> authentication() async {
     final supabaseClient = Injector.appInstance.get<SupabaseClient>();
     final sharedPreferences = await SharedPreferences.getInstance();
     final session = sharedPreferences.getString(persistentSessionKey);
     final user = supabaseClient.auth.user();
     if (user == null) {
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => LoginPage()));
     } else {
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => DataSaw()));
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
  }
}