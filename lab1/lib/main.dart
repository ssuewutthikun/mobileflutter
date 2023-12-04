/****  2.Operator  */

  // comment แบบ 1 บรรทัด
  /**
   * หลายบรรทัด
   * หลายบรรทัด
   */

void main() {
  // มี main เป็น method หลักในการทำงาน
  print("Hello");

  /* Declare function variable
      1. ใช้ _ $ ได้
      2. ขึ้นต้นด้วยตัวเลขไม่ได้
      3. ตัวเล็ก-ตัวใหญ่ถือว่าแตกต่างกัน
      4. คำสวงน จะเหมือนกับ java
  */

  /* DataType
      Numbers 
        integer
        double
      String
      Boolean
      Lists เป็น object ที่เรียงลำดับคล้าย array
      Map เป็นชุดข้อมูล object ที่ต้องมี key และ value
      Dynamics ใช้สำหรับกรณีที่ไม่มีความชัดเจนของค่าภายใน
  */
  int num;
  double money = 20.25;
  String studentID, studentClass;
  bool isCheck;
  dynamic getValue;

  /** declear special
   * var  ตัวแปรทั่วไป
   * final ไม่สามารถเปลี่ยนแปลงค่าได้ final y;
   * const ไม่สามารถเปลี่ยนแปลงค่าได้ แต่ต้อง assign ตั้งแต่เริ่ม cost x=10;
  */
  final int fn_x;
  fn_x = 20;
  //fn_x = 30;
  //const int cs_x;
  //const int cs_x = 40;

  //var x = 1000  //valid
  //var int x = 1000 // invalid

  print(money);
  //print(num); // is not empty ;except dynamic
  print(getValue);

  List<String> fruits = ['apple', 'banana', 'mango'];
  //var fruits = ['apple', 'banana', 'mango']; // ไม่ระบุชนิดข้อมูล //อ.ไม่ชอบ
  print(fruits.length);
  fruits.add('orange');
  fruits.add('durian');
  print(fruits);
  print(fruits[2]);
  fruits[2] = "longan";
  print(fruits);
  fruits.remove('banana');
  print(fruits);
  fruits.remove(fruits[1]);
  print(fruits);

  for (var item in fruits) {
    // loop list
    print(item);
  }
  print("#### same same #####");
  fruits.forEach((item) {
    // loop list
    print(item);
  });

  Map<String, dynamic> profileMember = {
    'name': 'sarawut',
    'surname': 'suewutthikun',
    'phone': '0641123089',
    'age': 38,
    'bdate': '2023-05-28'
  }; // ลอง เปลี่ยนจาก dynamic ไปเป็นอย่างอื่น
  //var capitals = {'USA': 'Washington D.C.', 'Japan': 'Tokyo'}; // ไม่ระบุชนิดข้อมูล //อ.ไม่ชอบ
  print(profileMember);
  print(profileMember['surname']);
  profileMember['surname'] = 'shanks wano';
  print(profileMember);

  profileMember.forEach((key, value) {
    print('Key: $key => Value: $value');
  });

  profileMember.remove('bdate');
  print(profileMember);

  /** Relation 
   * == ===
   * !=
   * >
   * <
   * >=
   * <=
  */

  /** Logical Oper. 
   * &&
   * ||
   * !
  */

  /* String Oper. */
  String name = "sarawut";
  String surname = "suewutthikun";
  int age = 39;
  //print('Mr. ' + name + ' ' + surname + ' Age:' + age);
  print('Mr. ' + name + ' ' + surname + ' Age:' + age.toString());
  var x = 'Mr. ' + name + ' ' + surname + ' Age:' + age.toString();
  print(x)

  /* Cast Oper. */
  String x_cast = "30";
  String y_cast = "65.75";
  dynamic xy_result;
  //xy_result = x_cast + 10; //int.parse(string) //double.parse(string)
  print(xy_result);

  /** if else
    กำหนดค่า x เป็น ?
    ให้รับค่า y เป็น ?
    และแสดงผลลัพธ์ของการคูณ x*y ทางหน้าจอ
    ถ้าผลลัพธ์ผลลัทธ์ มากกว่า 10 ให้แสดงข้อความว่า "Result over more than 10"
    และถ้าผล์ผลลัทธ์ น้อยกว่า 10ให้แสดงข้อความว่า "Result less than 10"
   */

  /** if else if
    ให้นักศึกษาเขียนโปรแกรมเครื่องคิดเลขอย่างง่ายโดยการทำงาน
    กำหนดให้ x และ y เป็น ?
    กำหนดให้ mode เป็นได้แค่ A - D
    ซึ่งโปรแกรมสามารถทำ การบวก ลบ คูณ หาร ได้โดยรับคำสั่งตัวอักษร
    A 	หมายถึงต้องการบวก  	x+y
    S 	หมายถึงต้องการลบ	x-y
    M	  หมายถึงต้องการคูณ	x*y
    D	  หมายถึงต้องการหาร	x/y
    โดยโปรแกรมจะมี interface ดังนี้
    input X: 10
    input Y: 20
    select mode (A S M D): A
    result: 30
   */

  /** for และ while
    กำหนดให้ x และ y เป็น ?
    และใช้ Loop For ในการสร้างเครืองหมาย * ตามจำนวนที่รับค่า X มา
    และใช้ Loop For ในการสร้างเครืองหมาย # ตามจำนวนที่รับค่า Y มา
    โดยมีการแสดงผลดังต่อไปนี้ คือ โปรแกรมจะวนลูป print * ตามค่า X
    และหากรอบการทำงานที่หาร 5 จะมีการวนลูป print # ตามค่า Y
    และหากเป็นรอบที่ 3 ของ การพิมพ์ * ให้ใช้ คำสั่ง continue  
    โดยโปรแกรมจะมี interface ดังนี้
    input X: 15
    input Y: 3
    result : *****###*****###*****###
   */

  /*
    Matrix A   x   Matrix B   //แถว A คูณ หลัก B
    1 2 3           9 8 7     // 1x9  + 2x6   + 3x3 = 30
    4 5 6           6 5 4     // 4x9  + 5x6   + 6x3  = 36 + 30 + 18 = 84
    7 8 9           3 2 1
    
    Result Matrix
    30 24 18
    84 69 54
    138 114 90

   */
  List<List<int>> matrixA = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  List<List<int>> matrixB = [
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1]
  ];
}
