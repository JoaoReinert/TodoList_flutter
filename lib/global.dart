
import 'infrastructure/todo_list/repository/todo_list_repository_imp.dart';
import 'infrastructure/todo_list/usecase/todo_list_usecase.dart';
import 'infrastructure/todo_list/usecase/todo_list_usecase_imp.dart';
import 'infrastructure/todo_list/webservice/todo_list_webservice.dart';

late TodoListUseCase todoListUseCase;

Future<void> initializeState(TodoListWS todoListWebService) async {
  todoListUseCase = newTodoListUseCase(
    newTodoListRepository(todoListWebService),
  );
}