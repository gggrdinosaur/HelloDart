//数字 集合 字符串等  (https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more)
void numbers_collections_strings_and_more(){
  print('*' * 40);
  print('数字 集合 字符串等');
  print('*' * 40);

  //使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  //使用num的parse()方法，该方法可能会创建一个整型，否则为浮点型对象
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //使用redix:指定整数的进制基数
  assert(int.parse('42', radix: 16) == 66);    //十六进制 

  //conver an int to a string
  assert(42.toString() == '42');

  //conver a double to a string
  assert(1234.56.toString() == '1234.56');

  //Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');  //指定小数点右边的数

  //specify the number of significant figures
  assert(1234.56.toStringAsPrecision(2) == '1.2e+2');   //指定字符串中的有效数字的位数
  assert(double.parse('1.2e+2')  ==120.0);
 
  //从字符串中搜索
  //check whether a string contains another string
  assert('Never odd or even'.contains('odd'));

  //does a string start with another string
  assert('Never odd or even'.startWith('Never'));

  //does a string end with another string
  assert('Never odd or even'.endWith('even'));

  //find the location od a string inside a string
  assert('Never odd or even'.indexOf('or') == 10)

  //从字符串中提取数据
  //grab a substring
  assert('Never odd or even'.substring(10,12) == 'or');

  //split a string using a string pattern
  var  parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[1] == 'web');

  //get a UTF-16 code unit (as a string) by index
  assert('Never odd or even'[1] == 'e');

  //use split() with an empty string parameter to get
  //a list of all characters (as Strings); good for iterating
  for ( final char in 'hello'.split()){
    print(char);
  }

  //get all the UTF-16 code units in the string
  //UTF  编码 （https://www.jianshu.com/p/ba7fb4a651c7）
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnits[0] == 78);

  //字母大小写转化
  //土耳其字母表的无点/转换是不正确的,无效
  //conver to uppercase
  assert('web apps'.toUpperCase() == 'WEB APPS');
  
  //conver to lowercase
  assert('WEB APPS'.toLowerCase() == 'web apps');

  //Trimming和空字符串
  //Trim a string
  assert('   hello    '.trim() == 'hello');

  //check whether a string is empty
  assert(''.isEmpty);

  //string with only white space are not empty
  assert('    '.isNotEmpty);

  //替换部分字符串
  var greetingTemplate = 'Hello,NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'),'John');
  //greetingTemplate didn't change
  assert(greeting != greetingTemplate);

  //构建一个字符串
  //第一个点代表添加对象，第二个点才是操作符
  //https://stackoverflow.com/questions/49447736/list-use-of-double-dot-in-dart
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient','string','creation'],' ')  //writeAll()的第二个参数用来指定分隔符
    ..write('.');   //书写结束

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBUffer for efficient string creation.');

}


void main(List<String> args){
  numbers_collections_strings_and_more();
}