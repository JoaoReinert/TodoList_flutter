import '../../entities/task_entity.dart';

abstract class TodoListUseCase {
  Future<void> adicionarTarefa(Task task);

  Future<List<Task>> selectAllTasks();

  Future<void> updateTask (Task task);

  Future<void> deleteTask (Task task);
}