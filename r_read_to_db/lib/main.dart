import 'package:flutter/material.dart';
import 'package:r_read_to_db/customer_list.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CustomerListPage()//LoginPage()
    );
  }
}