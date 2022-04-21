import 'dart:convert';
import 'dart:io';

import 'package: args/args.dart';

const lineNUmber = 'line-number';

void main(List<String> args){

  exitCode = 0;  //presume success

  final parser = ArgParser();
  parser.addFlag(lineNumber, negatable： false, abbr:'n');

  ArgResults argResults = parser.parse(args);
  final paths = argResults.rest;
dcat (paths, showLineNumbers : argResults[lineNumber] as bool);

}

Future<void> dcat(List<String> paths, {bool showLineNumbers = false}) async {
  if (paths.isEmpty ){
    print('type exit to quit');
   while(true){
  stdout.write('>>> ');
     String line = stdin.readLineSync(); 
     print('$line\n');

     if (line?.toLowerCase() == 'exit'){
       print('bye..');
       break;
     }
   }
  }else{
    for (final path in paths){
      var lineNUmber = 1;

      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());


      try{
        await for (final line in lines){
          if(showLineNumbers){
           stdout.write('${lineNUmber++}  ');
          }

          print(line);
        }
      }catch(_){
        await _handleError(path);
      }
    }
  }
}
_handleError(String path){
  if (await FileSystemEntity.isDirectory(path)){
    stderr.writeln(('error:$path is a directory'));
  }else{
    exitCode = 2;
  }
}