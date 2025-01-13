import 'domain/todo_list_usecase.dart';

import 'modules/todo_list/todo_list_repository_imp.dart';
import 'modules/todo_list/todo_list_usecase_imp.dart';
import 'webservice/todo_list_webservice.dart';

late TodoListUseCase todoListUseCase;

Future<void> initializeState(TodoListWS todoListWebService) async {
  todoListUseCase = newTodoListUseCase(
    newTodoListRepository(todoListWebService),
  );
}
