import 'dart:math';  //导入库函数
//变量：https://dart.cn/samples#variables
void variable() {
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
  }

}

//函数：https://dart.cn/samples#functions
//=> (胖箭头) 简写语法用于仅包含一条语句的函数
int fibonacci(int n){
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

//导入
//使用import可以导入其他库中的API
//import 'dart:math';

//类

void main(List<String> args) {
  //变量
  /*variable();

  //流程控制语句
  control();*/

  //函数
  var result = fibonacci(10);
  print('result is $result');



}