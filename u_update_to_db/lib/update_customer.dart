import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateCustomerPage extends StatefulWidget {
  final Map<String, dynamic> customerData;

  UpdateCustomerPage({required this.customerData});

  @override
  _UpdateCustomerPageState createState() => _UpdateCustomerPageState();
}

class _UpdateCustomerPageState extends State<UpdateCustomerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.customerData["cus_name"];
    usernameController.text = widget.customerData["cus_username"];
    passwordController.text = widget.customerData["cus_password"] ?? ""; // เผื่อไม่มีรหัสผ่าน
  }

  Future<void> updateCustomer() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Map<String, String> dataPost = {
      "cus_id": widget.customerData["cus_id"],
      "cus_name": nameController.text,
      "cus_username": usernameController.text,
      "cus_password": passwordController.text
    };

    var uri = Uri.parse("http://192.168.1.138/flutter_webservice_68_bisxx/update_customer.php");
    var response = await http.post(
      uri,
      headers: headers,
      body: json.encode(dataPost),
      encoding: Encoding.getByName("utf-8"),
    );

    Map respJson = json.decode(response.body);
    print(respJson);

    if (respJson["result"] == 1) {
      print("Update Successful");
      Navigator.pop(context);
    } else {
      print("Update Failed");
    }
  }

  Widget inputCustomerName() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: "Name",
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget inputUsername() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          labelText: "Username",
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget inputPassword() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: updateCustomer,
        child: Text("Update Customer"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Customer")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          inputCustomerName(),
          inputUsername(),
          inputPassword(),
          buildSubmitButton(),
        ],
      ),
    );
  }
}
