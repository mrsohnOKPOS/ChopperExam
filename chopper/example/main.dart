import 'package:chopper/chopper.dart';

import 'definition.dart';
import '../lib/src/jsonLogPrint.dart';



Future<void> main() async {
  final chopper = ChopperClient(
    baseUrl: Uri.parse('https://tmaapp.okpos.co.kr:8080'),
    services: [
      // the generated service
      MyService.create(ChopperClient()),
    ],
    converter: JsonConverter(),
  );

  final myService = chopper.getService<MyService>();
  final stoerList = await myService.getStoreList();
  jsonLogPrint.log(stoerList.bodyString);
  // Map userMap = jsonDecode(stoerList.bodyString);
  // var user = StoreData.fromJson(userMap);

  chopper.dispose();
}


