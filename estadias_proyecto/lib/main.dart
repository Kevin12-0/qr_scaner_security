import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'Pages/data_saw.dart';
import 'Pages/login.dart';

const supabaseUrl = 'https://btuoufefhitjxkokehcv.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjA4ODg2NiwiZXhwIjoxOTQ3NjY0ODY2fQ.ZiTSw9IpT6xK1cuamn5UnViCvzprpl0nQX1QOtouwZo';
final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: DataSaw(),
    );
  }
}