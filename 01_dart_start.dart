import 'dart:math';  //导入库函数
import 'dart:async';
import 'dart:io';

//变量：https://dart.cn/samples#variables
void variable() {
  print('#'*50);
  print('变量');
  print('#'*50);

  var name = 'Voyager I';
  var year = 2022;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
  };

  print('name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects,image is $image');
}

//流程控制语句：https://dart.cn/samples#control-flow-statements
void control(){
  print('#'*50);
  print('控制流程');
  print('#'*50);

  var name = 'Voyager I';
  var year = 2022;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
    };
  if (year >= 2001) {
   print('21st century');
  } else if (year >= 1901) {
   print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
    print(year);
  }

}

//函数：https://dart.cn/samples#functions
//=> (胖箭头) 简写语法用于仅包含一条语句的函数
int fibonacci(int n){
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

bool is_hit(String line, String target) {
  return line.contains(target);
}

void functions() {
  print('#' * 50);
  print('函数');
  print('#' * 50);

  var fib = fibonacci(10);
  print('fib 10 is $fib');

  var flybyObjects = [
    'hello',
    'abc',
    '123',
    'how do you do',
    'nice to meet you'
  ];
  flybyObjects.where((name) => name.contains('you')).forEach(print);

  var hit_lines = flybyObjects.where((x) => is_hit(x, 'o'));
  for (var one in hit_lines) {
    print('one is $one');
  }
}

//注释  https://dart.cn/samples#imports
void commments(){
  print('#'*50);
  print('注释');
  print('#' * 50);

  /// 这是一个文档注释。
  /// 文档注释用于为库、类以及类的成员添加注释。
  /// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。
  /* 也可以像这样使用单斜杠和星号的注释方式 */
  print('comments prints nothing.');
}

//导入   https://dart.cn/samples#imports
//使用import可以导入其他库中的API
void imports() {
  print('#' * 50);
  print('导入');
  print('#' * 50);

  var mypi = pi;
  print('pi is $mypi');

  var x = pi / 4;
  var y = cos(x);
  print('cos(pi/4) is $y');
}


//类  https://dart.cn/samples#classes
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // TODO: init.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Methods.
  void describe() {
    print('Spacecraft: $name');

    // Type promotion dos not work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void classes() {
  print('\n');
  print('#' * 40);
  print('类');
  print('#' * 40);

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  var voyager3 = Spacecraft.unlaunched('Voyager III');

  voyager.describe();
  voyager3.describe();
}

void main(List<String> args) {
  //变量
  variable();

  //流程控制语句
  control();

  //函数
  functions();

}