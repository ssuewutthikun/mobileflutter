/****  3.Class  */
class firstClass {
  void methodOne() {
    print("Hi");
  }
  /*
   class <ชือคลาส> {
    [fields]  // เป็นตัวแปรใดๆ หรือ เป็น object
    [getters/setters] // function-getters read fields  // function-setters access fields 
    [constructors] //object ที่สามารถเข้าใช้ methods หรือ function 
    [function]  //หรือ  methods
   }
  */
}

class secondClass {
  String engine = "T-99";
  void disp() {
    print(engine);
  }
}

class thirdClass {
  int seat = 5;
  thirdClass(int x) {
    print("constructor : " + x.toString());
  }
  thirdClass.engine(String eng) {
    print("engine : " + eng);
  }
  thirdClass.brand(String brand) {
    print("brand : " + brand);
  }
  thirdClass.seat(int seat) {
    print("seat orgi : " + this.seat.toString());
    print("seat edition : " + seat.toString());
  }
  void disp(int master) {
    print("master : " + master.toString());
  }
}

/** extends **
class shape {
  void cal_area() {
    print("Calculating the area of geometric shapes");
  }
}

class square extends shape {
  void main() {
    var obj = new square();
    obj.cal_area();
  }
}
*/

/** override *
class shape {
  void cal_area(int a) {
    print("Calculating the area of geometric shapes");
  }
}

class square extends shape {
  void cal_area(int b) {
    int area = b * b;
    print("four shape:" + area.toString());
  }
}

void main() {
  var obj = new square();
  obj.cal_area(5);
}
*/

/** override *
class staticMem {
  static int num;
  disp(){
    print("num : "+num.toString())
  }
}

void main() {
  staticMem.num =12;
  var a = new staticMem();
  a.disp();
} 
*/

/**  Super *
class Car{
  String model = 'model:Vigo';
  void brand(String a){
    print('brand :'+a);
  }
}

class newCar extends Car{
  @verride
  void brand(String b){
    print('my car is '+b);
    super.brand('HONDA');
    print(super.model);
  }
}

void main(){
  var c =new newCar();
  c.brand('TOYOTA');
}

*/

void main() {
  firstClass fc = new firstClass();
  fc.methodOne();
  print("Hello");

  secondClass scOne = new secondClass();
  secondClass scTwo = new secondClass();
  scOne.disp();
  scOne.engine = "T-88";
  scOne.disp();
  scTwo.disp();

  thirdClass tcOne = new thirdClass(10);
  tcOne.disp(223);
  thirdClass tcTwo = new thirdClass.engine("RXZ-40");
  thirdClass tcThree = new thirdClass.brand("Honda");
  thirdClass tcFour = new thirdClass.seat(7);
}
