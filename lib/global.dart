import 'package:todo_list_lince/domain/todo_list/usecase/todo_list_usecase.dart';

import 'domain/todo_list/repository/todo_list_repository_imp.dart';
import 'domain/todo_list/usecase/todo_list_usecase_imp.dart';
import 'domain/todo_list/webservice/todo_list_webservice.dart';

late TodoListUseCase todoListUseCase;

Future<void> initializeState(TodoListWS todoListWebService) async {
  todoListUseCase = newTodoListUseCase(
    newTodoListRepository(todoListWebService),
  );
}