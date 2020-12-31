import 'package:sqldebug/src/commander.dart';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    print("Provide a key argument");
    return;
  }
  final key = args[0];
  final cli = createSqlDebugCli(key);
  await cli.run();
}
