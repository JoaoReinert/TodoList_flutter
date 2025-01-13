import 'package:flutter/cupertino.dart';
import 'package:todo_list_lince/entities/task_entity.dart';

import '../../../domain/todo_list_usecase.dart';

/// State for task list screen
class TodoListState extends ChangeNotifier {
  final TodoListUseCase _useCase;

  TodoListState({
    required TodoListUseCase useCase,
  }) : _useCase = useCase {
    init();
  }

  final formKey = GlobalKey<FormState>();
  final _listTasks = <Task>[];
  final _controllerTask = TextEditingController();

  TextEditingController get controllerTask => _controllerTask;

  List<Task> get listTasks => _listTasks;

  void init() {
    selectAllTasks();
    notifyListeners();
  }

  void load() {
    selectAllTasks();
    notifyListeners();
  }

  Future<void> adicionarTarefa() async {
    await _useCase.adicionarTarefa(Task(name: _controllerTask.text));
    load();
    controllerTask.clear();
  }

  Future<void> selectAllTasks() async {
    try {
      final tasks = await _useCase.selectAllTasks();
      _listTasks
        ..clear()
        ..addAll(tasks);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _useCase.updateTask(
        Task(
          id: task.id,
          name: _controllerTask.text,
          isCompleted: task.isCompleted,
        ),
      );
      load();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _useCase.deleteTask(task);
    } catch (e) {
      print(e);
    }
  }

  void populaTask(Task task) {
    _controllerTask.text = task.name;
  }

  Future<void> isCompleted(Task task) async {
    try {
      _useCase.updateTask(
        Task(
          id: task.id,
          name: task.name,
          isCompleted: task.isCompleted,
        ),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
