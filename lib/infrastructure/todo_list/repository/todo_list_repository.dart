import 'package:todo_list_lince/domain/entities/task_entity.dart';

abstract class TodoListRepository {

  Future<void> adicionarTarefa(Task task);

  Future<List<Task>> selectAllTasks();

  Future<void> updateTask (Task task);

  Future<void> deleteTask (Task task);
}