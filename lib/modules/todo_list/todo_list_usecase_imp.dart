import 'package:todo_list_lince/domain/todo_list_usecase.dart';

import '../../entities/task_entity.dart';

import '../../data_store/todo_list_repository.dart';

TodoListUseCase newTodoListUseCase(TodoListRepository todoListRepository) {
  return TodoListUseCaseImp(todoListRepository);
}

class TodoListUseCaseImp implements TodoListUseCase {
  final TodoListRepository _repository;

  TodoListUseCaseImp(this._repository);

  @override
  Future<void> addTask(Task task) => _repository.addTask(task);

  @override
  Future<List<Task>> getTasks() => _repository.getTasks();

  @override
  Future<void> updateTask(Task task) => _repository.updateTask(task);

  @override
  Future<void> deleteTask(Task task) => _repository.deleteTask(task);
}
