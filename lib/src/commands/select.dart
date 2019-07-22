import 'package:nodecommander/nodecommander.dart';
import 'response.dart';

NodeCommand selectCommand() {
  return NodeCommand(
      name: "select",
      executor: (NodeCommand cmd, dynamic parameters) async {
        final db = parameters[0];
        //print("ARGS ${cmd.arguments}");
        String query = getSelectQuery(cmd.arguments);
        print("QUERY: $query");
        final res = await db.query(query, verbose: true);
        cmd.payload = {"result": res};
        print("COMMAND executed");
        //cmd.info();
        return cmd;
      },
      responseProcessor: (NodeCommand cmd) {
        printResult(cmd);
        return;
      });
}

String getSelectQuery(List<dynamic> args) {
  String q = "";
  if (args.isEmpty) {
    q = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;";
  }
  if (args.length == 1) {
    q = "SELECT * FROM ${args[0]}";
  }
  return q;
}
