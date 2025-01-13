
import 'package:todo_list_lince/data_store/todo_list_repository.dart';

import '../../entities/task_entity.dart';
import '../../database/database.dart';
import '../../database/tables/todo_list_tables/dart/task_table.dart';
import '../../webservice/todo_list_webservice.dart';

TodoListRepository newTodoListRepository (TodoListWS todoListWebService) {
  return TodoListRepositoryImp(todoListWebService);
}

class TodoListRepositoryImp implements TodoListRepository {
  final TodoListWS webService;
  TodoListRepositoryImp(this.webService);

  @override
  Future<void> adicionarTarefa(Task task) async {
    final db = await getDataBase();
    await db.insert(
      TaskTable.tableName,
      {
        TaskTable.name: task.name,
        TaskTable.numberForIsCompleted: task.isCompleted == true ? 1 : 0,
      },
    );
  }

  @override
  Future<List<Task>> selectAllTasks() async {
    final db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      TaskTable.tableName,
    );

    var list = <Task>[];

    for (final item in result) {
      list.add(
        Task(
          id: item['id'],
          name: item['name'],
          isCompleted: item['number_for_is_completed'] == 1 ? true : false,
        ),
      );
    }
    return list;
  }

  @override
  Future<int> updateTask(Task task) async {
    final db = await getDataBase();
    return await db.update(
      TaskTable.tableName,
      {
        TaskTable.name: task.name,
        TaskTable.numberForIsCompleted: task.isCompletedAsInt,
      },
      where: '${TaskTable.id} = ?',
      whereArgs: [task.id],
    );
  }

  @override
  Future<void> deleteTask(Task task) async {
    final db = await getDataBase();
    db.delete(
      TaskTable.tableName,
      where: '${TaskTable.id} = ?',
      whereArgs: [task.id],
    );
  }
}