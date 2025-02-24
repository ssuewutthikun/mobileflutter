import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InsertCustomerPage extends StatefulWidget {
  @override
  _InsertCustomerPageState createState() => _InsertCustomerPageState();
}

class _InsertCustomerPageState extends State<InsertCustomerPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> insertCustomer() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Map<String, String> dataPost = {
      "cus_id": idController.text,
      "cus_name": nameController.text,
      "cus_username": usernameController.text,
      "cus_password": passwordController.text
    };

    var uri = Uri.parse("http://172.24.131.223/flutter_webservice_68_bisxx/set_customer.php");
    var response = await http.post(
      uri,
      headers: headers,
      body: json.encode(dataPost),
      encoding: Encoding.getByName("utf-8"),
    );

    Map respJson = json.decode(response.body);
    print(respJson);

    if (respJson["result"] == 1) {
      print("Insert Successful");
      Navigator.pop(context);
    } else {
      print("Insert Failed");
    }
  }

  Widget inputCustomerID() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: idController,
        decoration: InputDecoration(
          labelText: "Customer ID",
          prefixIcon: Icon(Icons.perm_identity),
          border: OutlineInputBorder(),
        ),
      ),
    );
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
        onPressed: insertCustomer,
        child: Text("Add Customer"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insert Customer")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          inputCustomerID(),
          inputCustomerName(),
          inputUsername(),
          inputPassword(),
          buildSubmitButton(),
        ],
      ),
    );
  }
}
