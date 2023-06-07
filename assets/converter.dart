import 'package:converter/converter.dart' as converter;
import 'dart:async';
import 'dart:io';

void main(List<String> arguments) async {
  final file = await File('file.txt').readAsString();
  print('done');
}
