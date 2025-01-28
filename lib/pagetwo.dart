import 'package:flutter/material.dart';
import 'package:lab4bis3n/pageOne.dart';

class pageTwo extends StatefulWidget {
  final Map<String,String> passval;
  //const pageTwo({super.key});
  const pageTwo({Key?key,required this.passval}):super(key:key);

  @override
  State<pageTwo> createState() => _pageTwoState();
}

class _pageTwoState extends State<pageTwo> {

  Widget LabelText1(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text("pageTwo"),
    );
  }  

  Widget LabelVal1(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text("ค่าที่ 1:"),
    );
  }    

  Widget LabelVal2(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text("ค่าที่ 2:"),
    );
  }   

  Widget buttonGoBack(){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: ElevatedButton(
        onPressed: (){
          print("on-click");
          Navigator.of(this.context).pushReplacement(MaterialPageRoute(builder: (context)=>pageOne()));
        }, 
        child: Text("GoBack")
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
                      children: [LabelText1(),LabelVal1(),LabelVal2(),buttonGoBack()],
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