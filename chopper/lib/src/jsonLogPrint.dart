import 'package:chopper/chopper.dart';

import 'dart:convert';

class jsonLogPrint {
  static String log(String input) {
    // JsonDecoder decoder = JsonDecoder();
    // JsonEncoder encoder = JsonEncoder.withIndent('  ');
    var object = json.decode(input);
    var prettyString = JsonEncoder.withIndent('  ').convert(object);

    print(prettyString);
    return prettyString;
  }
}


