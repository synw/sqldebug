import 'dart:async';

import 'package:nodecommander/nodecommander.dart';
import 'package:wifi/wifi.dart';
import 'package:sqlcool/sqlcool.dart';

import 'commands/select.dart';

Future<NodeCommand> execSelect(NodeCommand cmd) async {
  //print("Command executed $cmd");
  //cmd.info();
  //print("CMD ARGS ${cmd.arguments}");
  final db = cmd.arguments[0] as Db;
  //print("ARGS ${cmd.arguments}");
  cmd.arguments.removeAt(0);
  final query = getSelectQuery(cmd.arguments);
  //print("QUERY: $query");
  final res = await db.query(query, verbose: true);
  final ncmd = cmd.copyWithPayload(<String, dynamic>{"result": res});
  //print("COMMAND executed");
  //cmd.info();
  return ncmd;
}

NodeCommand selectCmd = selectCommand().copyWithExecMethods(exec: execSelect);

Future<void> initSqlDebugSoldierNode(Db db, String key) async {
  final host = await Wifi.ip;
  final sc = selectCmd.copyWithArguments(<dynamic>[db]);
  final node = SoldierNode(
      key: key,
      name: "sqldebug_soldier",
      commands: <NodeCommand>[sc],
      host: host,
      verbose: true);
  //node.commands[0].info();
  // initialize the node
  await node.init();
  // print some info about the node
  node.info();
  // idle
  await Completer<void>().future;
}
