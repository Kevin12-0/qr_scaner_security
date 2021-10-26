import 'package:flutter/material.dart';
import 'package:operaciones_crud/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HomePage",
      home: HomePage(),
    );
  }
}
