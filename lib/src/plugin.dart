import 'package:nodecommander/nodecommander.dart';
import 'commands/select.dart';

List<NodeCommand> sqlDebugCommands() {
  return <NodeCommand>[selectCommand()];
}

final testcmd = NodeCommand.define(
    name: "test_cmd",
    executor: (NodeCommand cmd) async {
      cmd.copyWithPayload(<String, dynamic>{"result": "ok"});
      return cmd;
    });
