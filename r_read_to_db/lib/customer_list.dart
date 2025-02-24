import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerListPage extends StatefulWidget {
  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  List customers = [];

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    final response = await http.get(
      Uri.parse("http://172.24.131.223/flutter_webservice_68_bisxx/get_customerlist.php")
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data["result"] == 1) {
        setState(() {
          customers = data["customers"];
        });
      }
    } else {
      throw Exception("Failed to load customers");
    }
  }

  Widget appTitle() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        "Customer List",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget customerItem(Map<String, dynamic> customer) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(customer["cus_id"].substring(0, 2)), // แสดงตัวอักษรแรกของ ID
        ),
        title: Text(customer["cus_name"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("Username: ${customer["cus_username"]}"),
      ),
    );
  }

  Widget customerListView() {
    return customers.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              return customerItem(customers[index]);
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customers")),
      body: Column(
        children: [
          appTitle(),
          Expanded(child: customerListView()),
        ],
      ),
    );
  }
}
