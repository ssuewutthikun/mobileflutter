import 'package:flutter/material.dart';
import 'package:c_create_to_db/insert_customer.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:InsertCustomerPage()//LoginPage()
    );
  }
}