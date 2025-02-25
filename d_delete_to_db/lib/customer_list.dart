import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'delete_customer.dart';

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
    final response = await http.get(Uri.parse("http://172.24.142.34/flutter_webservice_68_bisxx/get_customer_list.php"));

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

  Widget customerItem(Map<String, dynamic> customer) {
    return ListTile(
      title: Text(customer["cus_name"]),
      subtitle: Text("Username: ${customer["cus_username"]}"),
      trailing: Icon(Icons.delete, color: Colors.red),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeleteCustomerPage(customerData: customer),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customers")),
      body: customers.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return customerItem(customers[index]);
              },
            ),
    );
  }
}
