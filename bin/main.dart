import 'package:nodecommander/nodecommander.dart';
import '../lib/src/plugin.dart';

void main() {
  final node = CommanderNode(port: 8085);
  final cli = NodeCommanderCli();
  cli.run(node, plugins: <NodeCommanderPlugin>[sqlDebugCommanderPlugin(node)]);
}
/*
void main2(List<String> args) async {
  if (args.isEmpty) {
    print("Select a soldier in arguments");
    exit(0);
  }
  String soldierName = args[0];
  final node = await init();
  if (node.hasSoldier(soldierName)) {
    final String to = node.soldierUri(soldierName);
    final String query = getQuery(args);
    node.command(NodeCommand(name: "query", arguments: <String>[query]), to);
  }
  final waiter = Completer<Null>();
  await waiter.future;
}

String getQuery(List<String> args) {
  String q = "";
  if (args.isEmpty) {
    q = "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;";
  }
  if (args.length == 1) {
    q = "SELECT * FROM ${args[0]}";
  }
  return q;
}

Future<CommanderNode> init() async {
  final node = CommanderNode(port: 8085, verbose: true);
  await node.init();
  node.commandsResponse.listen((NodeCommand cmd) {
    switch (cmd.name) {
      case "query":
        print("");
        for (final line
            in decodePayload(cmd.arguments[0].toString(), cmd.payload)) {
          print(line);
        }
        exit(0);
    }
  });
  node.info();
  await node.onReady;
  node.discoverNodes();
  await Future<dynamic>.delayed(Duration(seconds: 2));
  print("Soldiers: ${node.soldiers}}");
  for (final s in node.soldiers) {
    print("Found soldier ${s.name} at ${s.address}");
  }
  return node;
}*/
