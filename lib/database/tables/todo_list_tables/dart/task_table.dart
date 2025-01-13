class TaskTable {

  static const String tableName = 'task_table';

  static const String id = 'id';

  static const String name = 'name';

  static const String numberForIsCompleted = 'number_for_is_completed';

  static const String createTable = '''
  CREATE TABLE $tableName(
  $id                    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $name                  TEXT NOT NULL,
  $numberForIsCompleted  INTEGER NOT NULL DEFAULT 0
  );
  ''';
}