import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteCustomerPage extends StatefulWidget {
  final Map<String, dynamic> customerData;

  DeleteCustomerPage({required this.customerData});

  @override
  _DeleteCustomerPageState createState() => _DeleteCustomerPageState();
}

class _DeleteCustomerPageState extends State<DeleteCustomerPage> {
  Future<void> deleteCustomer() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Map<String, String> dataPost = {
      "cus_id": widget.customerData["cus_id"],
    };

    var uri = Uri.parse("http://172.24.142.34/flutter_webservice_68_bisxx/delete_customer.php");
    var response = await http.post(
      uri,
      headers: headers,
      body: json.encode(dataPost),
      encoding: Encoding.getByName("utf-8"),
    );

    Map respJson = json.decode(response.body);
    print(respJson);

    if (respJson["result"] == 1) {
      print("Delete Successful");
      Navigator.pop(context);
    } else {
      print("Delete Failed");
    }
  }

  Widget appName() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        "Delete Customer",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }

  Widget inputCustomerID() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        "Customer ID: ${widget.customerData["cus_id"]}",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget inputCustomerName() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        "Name: ${widget.customerData["cus_name"]}",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget inputUsername() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        "Username: ${widget.customerData["cus_username"]}",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget buildDeleteButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: deleteCustomer,
        child: Text("Confirm Delete"),
      ),
    );
  }

  Widget buildCancelButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Cancel"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Delete")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          appName(),
          inputCustomerID(),
          inputCustomerName(),
          inputUsername(),
          buildDeleteButton(),
          buildCancelButton(),
        ],
      ),
    );
  }
}
