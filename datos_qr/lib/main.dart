import 'package:datos_qr/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

void main() {
  const supabaseUrl = 'https://btuoufefhitjxkokehcv.supabase.co';
  const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjA4ODg2NiwiZXhwIjoxOTQ3NjY0ODY2fQ.ZiTSw9IpT6xK1cuamn5UnViCvzprpl0nQX1QOtouwZo';
  final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
  Injector.appInstance.registerSingleton<SupabaseClient>(() => supabaseClient);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoginPage',
      home: LoginPage(),
    );
  }
}
