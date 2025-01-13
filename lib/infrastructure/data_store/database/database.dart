import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../tables/todo_list_tables/task_table.dart';

Future<Database> getDataBase() async {
  final path = join(
    await getDatabasesPath(),
    'database.db',
  );

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskTable.createTable);
    },
    version: 1,
  );
}