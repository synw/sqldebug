import 'package:nodecommander/nodecommander.dart';
import 'commands/select.dart';

NodeCommanderPlugin sqlDebugSoldierPlugin() {
  return NodeCommanderPlugin(name: "sqldebug", commands: sqlDebugCommands());
}

NodeCommanderPlugin sqlDebugCommanderPlugin(CommanderNode node) {
  final sqlDebugPlugin = NodeCommanderPlugin(
      name: "sqldebug", commands: sqlDebugCommands(), node: node);
  return sqlDebugPlugin;
}

List<NodeCommand> sqlDebugCommands() {
  return <NodeCommand>[selectCommand()];
}

final testcmd = NodeCommand(
    name: "test_cmd",
    executor: (NodeCommand cmd, List<dynamic> args) async {
      cmd.payload = {"result": "ok"};
      return cmd;
    });
