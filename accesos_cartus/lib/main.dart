import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import 'package:accesos_cartus/pages/LoginPage.dart';

void main() {
  const supabaseUrl = 'https://dkdormbhbebnkyoacqoy.supabase.co';
  const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRrZG9ybWJoYmVibmt5b2FjcW95Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDU1OTA1NDYsImV4cCI6MTk2MTE2NjU0Nn0.2W4KCjolR03WRZu6wlDfSljkFnzRuDhK7MFFXow1H6w';
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