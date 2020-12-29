import 'package:nodecommander/nodecommander.dart';

import 'response.dart';

NodeCommand selectCommand() {
  return NodeCommand.define(
      name: "select",
      executor: (NodeCommand cmd) async {
        return cmd;
      },
      responseProcessor: (NodeCommand cmd) {
        printResult(cmd);
        return;
      });
}

String getSelectQuery(List<dynamic> args) {
  var q = "";
  if (args.isEmpty) {
    q = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;";
  } else if (args.length == 1) {
    q = "SELECT * FROM ${args[0]}";
  }
  return q;
}
