# Sqldebug

A [Node Commander](https://github.com/synw/nodecommander) plugin to run sql queries on device from desktop for debuging. Powered by [Sqlcool](https://github.com/synw/sqlcool) for database management.

## Usage

Create a soldier node on device:

   ```dart
   import 'package:pedantic/pedantic.dart';
   import 'package:sqldebug/sqldebug.dart';

   /// [db] is an Sqlcool database
   unawaited(initSqlDebugSoldierNode(db));
   ```

Run the cli in a terminal: `dart bin/main.dart`

Discover nodes and select the device to use:

   ```
   // autodiscover nodes
   > /d
   Found soldier my_node at 192.168.1.4:8084
   > /u my_node
   Using soldier my_node
   > select kvstore /// This runs a "select * from kvstore" query
   ---------------------------------
   id : 1 key : shopping_session value : 2 type : integer updated : 1563453824
   ---------------------------------
   id : 2 key : balance value : 818.0 type : double updated : 1563453824
   ---------------------------------
   id : 3 key : last_income value : 1 type : integer updated : 1563453824
   ```
