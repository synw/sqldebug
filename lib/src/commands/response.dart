import 'package:nodecommander/nodecommander.dart';

void printResult(NodeCommand cmd) {
//print("RESPONSE PROCESSOR $cmd");
  //final data = decodePayload(cmd.payload);
  //print("DECODED: $data / ${data.runtimeType}");
  final lines = <String>[];
  for (final row in cmd.payload["result"]) {
    //print("ROW: $row");
    String line = ("---------------------------------\n");
    for (final item in row.keys) {
      //print("ITEM: $item / ${row[item]}");
      line += "$item : ${row[item]} ";
    }
    lines.add(line);
  }
  print(lines.join('\n'));
}
