import 'dart:math';

//数字 集合 字符串等  (https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more)
void numbers_collections_strings_and_more() {
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
  assert(int.parse('42', radix: 16) == 66); //十六进制

  //conver an int to a string
  assert(42.toString() == '42');

  //conver a double to a string
  assert(1234.56.toString() == '1234.56');

  //Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46'); //指定小数点右边的数

  //specify the number of significant figures
  assert(123.456.toStringAsPrecision(2) == '1.2e+2'); //指定字符串中的有效数字的位数
  assert(double.parse('1.2e+2') == 120.0);

  //从字符串中搜索
  //check whether a string contains another string
  assert('Never odd or even'.contains('odd'));

  //does a string start with another string
  assert('Never odd or even'.startsWith('Never'));

  //does a string end with another string
  assert('Never odd or even'.endsWith('even'));

  //find the location od a string inside a string
  assert('Never odd or even'.indexOf('or') == 10);

  //从字符串中提取数据
  //grab a substring
  assert('Never odd or even'.substring(10, 12) == 'or');

  //split a string using a string pattern
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[1] == 'web');

  //get a UTF-16 code unit (as a string) by index
  assert('Never odd or even'[1] == 'e');

  //use split() with an empty string parameter to get
  //a list of all characters (as Strings); good for iterating
  for (final char in 'hello'.split('')) {
    print(char);
  }

  //get all the UTF-16 code units in the string
  //UTF  编码 （https://www.jianshu.com/p/ba7fb4a651c7）
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

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
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'John');
  //greetingTemplate didn't change
  assert(greeting != greetingTemplate);

  //构建一个字符串
  //第一个点代表添加对象，第二个点才是操作符
  //https://stackoverflow.com/questions/49447736/list-use-of-double-dot-in-dart
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(
        ['efficient', 'string', 'creation'], ' ') //writeAll()的第二个参数用来指定分隔符
    ..write('.'); //书写结束

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  //正则表达式
  //here is a  regular expression for one or more digits
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  // Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));

  // Loop through all matches.
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }
}

//集合  https://dart.cn/guides/libraries/library-tour#collections
void the_lists() {
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

// Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

//Use indexOf() to find the index of an object in a list


  fruits = ['bananas', 'apples', 'oranges'];

// Sort a list.
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  // Access a list item by index.
  assert(fruits[0] == 'apples');

// Find an item in a list.
  assert(fruits.indexOf('apples') == 0);

  fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
//fruits.add(5);
// // Error: 'int' can't be assigned to 'String'
}

void the_sets() {
  // Create an empty set of strings.
  var ingredients = <String>{};

// Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

// Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

// Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

// You can also create sets using
// one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);
  assert(atomicNumbers.length == 3);

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

// Check whether an item is in the set.
  assert(ingredients.contains('titanium'));

// Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

// Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void the_maps() {
  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

// Maps can be built from a constructor.
//declare a map using a terse literal syntax
  var searchTerms = Map();

// Maps are parameterized types; you can specify what
// types the key and value should be.
  var nobleGases = Map<int, String>();

//add, get, and set map items using the bracket syntax
//Use remove() to remove a key and its value from a map.
  nobleGases = {54: 'xenon'};

// Retrieve a value with a key.
  assert(nobleGases[54] == 'xenon');

// Check whether a map contains a key.
  assert(nobleGases.containsKey(54));

// Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

//retrieve all the values or all the keys from a map
  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

// Get all the keys as an unordered collection
// (an Iterable).
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

// Get all the values as an unordered collection
// (an Iterable of Lists).
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
// any https://blog.csdn.net/qq_42351033/article/details/108161475

//To check whether a map contains a key, use containsKey()
  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

//Use the putIfAbsent() method when you want to assign a value
// to a key if and only if the key does not already exist in a map.
  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }

  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

void the_public_methods() {
  //Use isEmpty or isNotEmpty to check whether a list, set, or map has items:
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

//To apply a function to each item in a list, set, or map, you can use forEach():
  teas = ['green', 'black', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));

//forEach() on a map, your function must take two arguments (the key and value):
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

//the map() method, which gives you all the results in a single object:
  teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
//To force your function to be called immediately on each item, use map().toList() or map().toSet():
  var loadTeas_str = loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
  print(loadTeas_str);

//Use Iterable’s where() method to get all the items that match a condition.
// Use Iterable’s any() and every() methods to check whether some or all items match a condition.
  teas = ['green', 'black', 'chamomile', 'earl grey'];

// Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// Use where() to find only the items that return true
// from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}

void collections() {
  print('\n');
  print('#' * 50);
  print('集合');
  print('#' * 50);

  the_lists();
  the_sets();
  the_maps();
  the_public_methods();
}

//URIs  https://dart.cn/guides/libraries/library-tour#uris
void uris() {
  //To encode and decode characters except those
  // with special meaning in a URI (such as /, :, &, #), use the encodeFull()
  //and decodeFull() methods.
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  uri = 'https://example.org/api?foo=some message';

  var encoded_1 = Uri.encodeComponent(uri);
  assert(encoded_1 == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded_1 = Uri.decodeComponent(encoded_1);
  assert(uri == decoded_1);

//Building URIs
/*uri = Uri(
    scheme: 'https',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag');

// To create a Uri from a string, use the parse() static method:
uri = Uri.parse('https://example.org:8080/foo/bar#frag');
assert(uri.toString() == 'https://example.org/foo/bar#frag');
assert(uri.scheme == 'https');
assert(uri.host == 'example.org');
assert(uri.path == '/foo/bar');
assert(uri.fragment == 'frag');
assert(uri.origin == 'https://example.org:8080');
*/
}

//时间和日期  https://dart.cn/guides/libraries/library-tour#dates-and-times
void dates_and_times() {
  print('#' * 50);
  print('时间和日期');
  print('#' * 50);

  // Get the current date and time.
  var now = DateTime.now();

// Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

//The millisecondsSinceEpoch property of a date returns the number of milliseconds
// 1/1/2000, UTC
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  y2k = DateTime.utc(2000);

// Add one year.
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);

// Subtract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

// Calculate the difference between two dates.
// Returns a Duration object.
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
}

//工具类  https://dart.cn/guides/libraries/library-tour#utility-classes

//异常  https://dart.cn/guides/libraries/library-tour#exceptions

//异步编程  https://dart.cn/guides/libraries/library-tour#dartasync---asynchronous-programming

//数学和随机数  https://dart.cn/guides/libraries/library-tour#dartmath---math-and-random
void math_and_random() {
  print('#' * 50);
  print('数学和随机数');
  print('#' * 50);

// Cosine
  assert(cos(pi) == -1.0);

// Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);
// radians is now 0.52359.
  var sinOf30degrees = sin(radians);
// sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);

//provides max() and min() methods:
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);

//数学常数
// See the Math library for additional constants.
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951

//随机数
  var random = Random();
  random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  random.nextInt(10); // Between 0 and 9.

  random = Random();
  random.nextBool(); // true or false
}

void main(List<String> args) {
  numbers_collections_strings_and_more();

  //集合
  collections();

  //时间和日期
  dates_and_times();

  //数学和随机数
  math_and_random();

}
