
import 'package:todo_list_lince/infrastructure/todo_list/usecase/todo_list_usecase.dart';

import '../../../domain/entities/task_entity.dart';

import '../repository/todo_list_repository.dart';

TodoListUseCase newTodoListUseCase(TodoListRepository todoListRepository) {
  return TodoListUseCaseImp(todoListRepository);
}

class TodoListUseCaseImp implements TodoListUseCase {

  final TodoListRepository _repository;
  TodoListUseCaseImp(this._repository);

  @override
  Future<void> adicionarTarefa(Task task) =>
      _repository.adicionarTarefa(task);

  @override
  Future<List<Task>> selectAllTasks() =>
      _repository.selectAllTasks();

  @override
  Future<void> updateTask(Task task) =>
      _repository.updateTask(task);

  @override
  Future<void> deleteTask (Task task) =>
      _repository.deleteTask(task);
}