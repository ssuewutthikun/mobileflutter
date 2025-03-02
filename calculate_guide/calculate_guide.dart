import 'package:flutter/material.dart';

class CalculateGuide extends StatefulWidget {
  const CalculateGuide({super.key});

  @override
  State<CalculateGuide> createState() => _CalculateGuideState();
}

class _CalculateGuideState extends State<CalculateGuide> {

  String selectedOperation = "Addition"; // ค่าดีฟอลต์ของ dropdown


  Widget operationDropdown() {
    return Container(
      margin: EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        value: selectedOperation,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10),
        ),
        items: ["Addition", "Subtraction", "Multiplication", "Division"]
            .map((operation) => DropdownMenuItem(
                  value: operation,
                  child: Text(operation),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedOperation = value!;
          });
        },
      ),
    );
  }

  Widget buttonNextPage() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          print("value selection: "+selectedOperation);
        },
        child: Text("Next Page"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Input Page")),
        body: SafeArea(
          child: ListView(
            children: [
              operationDropdown(),
              buttonNextPage(),
            ],
          ),
        ),
      ),
    );
  }
}
