import 'package:flutter/material.dart';
import 'package:lab4bis3n/pagetwo.dart';


class pageOne extends StatefulWidget {
  const pageOne({super.key});

  @override
  State<pageOne> createState() => _pageOneState();
}

class _pageOneState extends State<pageOne> {

  TextEditingController one_value = TextEditingController();
  TextEditingController two_value = TextEditingController();  

  Widget LabelText1(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text("PageOne"),
    );
  }  

  Widget inputOneOnPageOne(){
    return Container(
      child: TextFormField(
        controller: one_value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            hintText: null,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.numbers_sharp,
              color: Colors.blue,
            )),
      ),
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),    
    );    
  }

  Widget inputTwoOnPageOne(){
    return Container(
      child: TextFormField(
        controller: two_value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            hintText: null,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.numbers_sharp,
              color: Colors.blue,
            )),
      ),
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),    
    ); 
  }

  Widget buttonNextPage(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: ElevatedButton(
        onPressed: (){
          print("on-click");
          //print(one_value.text.toString());
          //print(two_value.text.toString());    

          Map<String,String> passdata={
            "inputval1":one_value.text.toString(),
            "inputval2":two_value.text.toString()
          };
          print(passdata);

          Navigator.of(this.context).pushReplacement(MaterialPageRoute(builder: (context)=>pageTwo(passval:passdata)));
        }, 
        child: Text("NextPage")
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Stack(
        children: [
          Scaffold(
            body:SafeArea(
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      children: [LabelText1(),inputOneOnPageOne(),inputTwoOnPageOne(),buttonNextPage()],
                    ),
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}