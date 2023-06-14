// import 'package:converter/converter.dart' as converter;
// import 'dart:async';
import 'dart:convert';
// import 'dart:js_interop';

import 'package:path/path.dart' as p;
import 'dart:io';

void main(List<String> arguments) async {
  final sourcePath = p.join(Directory.current.path, 'assets', 'en.json');
  final source = File(sourcePath);
  // final sourceContent = source.readAsStringSync();
  final enTrPath = p.join(Directory.current.path, 'assets', 'en_tr.txt');
  var enTr = await File(enTrPath).create();
  // final ruTrPath = p.join(Directory.current.path, 'assets', 'ru_tr.txt');
  // var ruTr = await File(ruTrPath).create();
  final keysPath = p.join(Directory.current.path, 'assets', 'keys.txt');
  var keys = await File(keysPath).create();

  final map = Map<String, String>.from(
    JsonCodec().decode(source.readAsStringSync()),
  );

  print(map.values.length);
  print(map.keys.length);

  var enTrString = map.values
      .fold('', (previousValue, element) => '$previousValue\r"$element"');
  // var ruTrString = 'asd';
  var keysString =
      map.keys.fold('', (previousValue, element) => '$previousValue\r$element');

  await enTr.writeAsString(enTrString);
  // await ruTr.writeAsString(ruTrString);
  await keys.writeAsString(keysString);

  print('done');
}
