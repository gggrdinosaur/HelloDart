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

void main(List<String> args) {
  //变量
  variable();
}