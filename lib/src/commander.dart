import 'package:nodecommander/nodecommander.dart';
import 'package:sqldebug/src/plugin.dart';

NodeCommanderCli createSqlDebugCli(String key) {
  final node = CommanderNode(
      key: key,
      name: "sqldebug_cli",
      commands: sqlDebugCommands(),
      port: 8085,
      verbose: true);
  return NodeCommanderCli(node);
}
