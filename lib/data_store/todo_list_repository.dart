import 'package:todo_list_lince/entities/task_entity.dart';

abstract class TodoListRepository {

  Future<void> addTask(Task task);

  Future<List<Task>> getTasks();

  Future<void> updateTask (Task task);

  Future<void> deleteTask (Task task);
}