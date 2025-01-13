import '../entities/task_entity.dart';

abstract class TodoListUseCase {
  Future<void> addTask(Task task);

  Future<List<Task>> getTasks();

  Future<void> updateTask (Task task);

  Future<void> deleteTask (Task task);
}