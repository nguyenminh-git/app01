import 'package:flutter/material.dart';
import 'package:project1/pages/first_page.dart';
void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContextcontext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FristPage(),
    );
  }
}