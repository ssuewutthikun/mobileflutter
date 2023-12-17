import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Text("สวัสดี"),
    ));*/

    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Text("สวัสดี"),
          color: Colors.green
        ),
      ),
    );**/

    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Text("สวัสดี"),
            color: Colors.green,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            width: 100,
            height: 150,
            alignment: Alignment.bottomCenter),
      ),
    );**/

    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Text(
              "Gemini AI ใหม่ของฝั่ง Google หลังปิดปากเงียบกริ๊บ เปิดตัวมา แรงมาก ๆ ด้วย Demo ที่จะทำให้เรา ว้าว มาก ๆ !!  ทั้งการ การดูสิ่งที่เราสื่อสาร ทั้งภาพและเสียง เล่นเกมส์ แก้ปัญหา โต้ตอบได้แบบ Realtime เร็วมาก ๆ และฉลาด มาก ๆ สามารถแนะนำ นำความเป็นไปได้ที่น่าจะเป็นไปได้",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.red // Color.fromRGBO(18, 127, 13, 1)),
                  ),
            ), //clip
            color: Colors.green,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            alignment: Alignment.topLeft),
      ),
    );**/

    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BISShop"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: null,
            )
          ],
          backgroundColor: Colors.blue.shade900,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Text("รายละเอียด", style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Container(
            child: Text(
              "Gemini AI ใหม่ของฝั่ง Google หลังปิดปากเงียบกริ๊บ เปิดตัวมา แรงมาก ๆ ด้วย Demo ที่จะทำให้เรา ว้าว มาก ๆ !!  ทั้งการ การดูสิ่งที่เราสื่อสาร ทั้งภาพและเสียง เล่นเกมส์ แก้ปัญหา โต้ตอบได้แบบ Realtime เร็วมาก ๆ และฉลาด มาก ๆ สามารถแนะนำ นำความเป็นไปได้ที่น่าจะเป็นไปได้",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.red // Color.fromRGBO(18, 127, 13, 1)),
                  ),
            ), //clip
            color: Colors.green,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            alignment: Alignment.topLeft),
      ),
    );**/

    /** wrap to xx ctrl+. */
    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BISShop"),
        ),
        body: Column(
          children: <Widget>[
            Text("สวัสดี"),
            Text("มหาววิทยาลัยเทคโนโลยีราชมงคลอีสาน วิทยาเขตขอนแก่น"),
            Text("สาขาระบบสารสนเทศ"),
          ],
          crossAxisAlignment: CrossAxisAlignment.start, //กำหนดวัตถุแนวนอน
          mainAxisAlignment: MainAxisAlignment.center, //กำหนดวัตถุแนวตั้ง
        ),
      ),
    );*/

    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BISShop"),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(flex: 7, child: Text("สวัสดี ศราวุธ ซื่อวุฒิกุล")),
                Expanded(flex: 3, child: Text("นักศึกษาห้องเรียนรายวิชาโมบาย")),
              ],
            ),
            Text("มหาววิทยาลัยเทคโนโลยีราชมงคลอีสาน วิทยาเขตขอนแก่น"),
            Text("สาขาระบบสารสนเทศ"),
          ],
        ),
      ),
    );**/

    //https://fonts.google.com/icons
    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BISShop"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.add_location,
              color: Colors.green,
              size: 60,
            ),
            Icon(
              Icons.add_alarm,
              color: Colors.green,
              size: 60,
            ),
          ],
        ),
      ),
    );**/

    /** 
    //image asset network
    //https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/ING_logo.jpg/800px-ING_logo.jpg
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BISShop"),
        ),
        body: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 200,
                      child: Image.asset("../images/logo.png"),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/ING_logo.jpg/800px-ING_logo.jpg"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );**/

    //ListView
    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Container(height: 200, color: Colors.orange),
            Container(height: 200, color: Colors.pink),
            Container(height: 200, color: Colors.green),
            Container(height: 200, color: Colors.purple),
            Container(height: 200, color: Colors.yellow)
          ],
        ),
      ),
    );**/
    /**return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: <Widget>[
            Container(height: 200, color: Colors.orange),
            Container(height: 200, color: Colors.pink),
            Container(height: 200, color: Colors.green),
            Container(height: 200, color: Colors.purple),
            Container(height: 200, color: Colors.yellow)
          ],
        ),
      ),
    );**/
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              children: [
                Container(height: 200, width: 200, color: Colors.orange),
                Container(height: 200, width: 200, color: Colors.pink),
                Container(height: 200, width: 200, color: Colors.green),
                Container(height: 200, width: 200, color: Colors.purple),
                Container(height: 200, width: 200, color: Colors.yellow),
              ],
            )
          ],
        ),
      ),
    );

    //https://api.flutter.dev/flutter/material
  }
}
