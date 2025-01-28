import 'package:flutter/material.dart';
import 'package:lab4bis3n/pageone.dart';
import 'package:lab4bis3n/pagetwo.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:pageOne() //pageOne()
    );
  }
}