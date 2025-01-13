import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global.dart';
import '../../utils/alert_dialog_default.dart';

import '../../../domain/entities/task_entity.dart';
import '../../utils/delete_button_default.dart';
import '../../utils/edit_button_default.dart';
import '../states/todo_list_state.dart';


/// General task list screen
class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListState>(
      create: (context) => TodoListState(useCase: todoListUseCase),
      child: Consumer<TodoListState>(builder: (_, state, __) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Lista de tarefas'),
          ),
          body: ListView.builder(
            itemCount: state.listTasks.length,
            itemBuilder: (context, index) {
              final task = state.listTasks[index];
              return _TaskTile(
                task: task,
                isCompleted: (value) {
                  task.isCompleted = value!;
                  task.isCompleted == true
                      ? task.isCompletedAsInt
                      : task.isCompleted == false;
                  state.isCompleted(task);
                },
                delete: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogDefault(
                        title: Text('Deseja mesmo excluir a tarefa?'),
                        performActionFunction: () {
                          state.deleteTask(task);
                          state.load();
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                edit: () async {
                  state.populaTask(task);
                  await showDialog(
                    context: context,
                    builder: (context) => ChangeNotifierProvider.value(
                      value: state,
                      child: DialogRegisterTask(
                        task: task,
                      ),
                    ),
                  );
                  await state.updateTask(task);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () async {
              state.controllerTask.clear();
              await showDialog(
                context: context,
                builder: (context) => ChangeNotifierProvider.value(
                  value: state,
                  child: DialogRegisterTask(),
                ),
              );
            },
            tooltip: 'Adicionar',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}

class _TaskTile extends StatelessWidget {
  const _TaskTile({
    required this.task,
    required this.delete,
    required this.edit,
    required this.isCompleted,
  });

  final Task task;
  final VoidCallback delete;
  final VoidCallback edit;
  final Function(bool?) isCompleted;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: ListTile(
        title: Text(
          task.name,
          style: TextStyle(
            decoration: task.isCompleted == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.blue,
                value: task.isCompleted == true,
                onChanged: isCompleted,
              ),
            ),
            SizedBox(
              height: 50,
              child: EditButtonDefault(
                edit: edit,
              ),
            ),
            SizedBox(
              height: 50,
              child: DeleteButtonDefault(
                delete: delete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogRegisterTask extends StatelessWidget {
  const DialogRegisterTask({super.key, this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TodoListState>(context);
    final isEditing = task?.id != null;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child:
                  isEditing ? Text('Editar tarefa') : Text('Adicionar tarefa'),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Form(
                key: state.formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                  ),
                  controller: state.controllerTask,
                  minLines: 1,
                  maxLines: 300,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo não pode ser vazio';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (state.formKey.currentState!.validate()) {
                        isEditing
                            ? await state.updateTask(task!)
                            : await state.adicionarTarefa();
                        Navigator.pop(context);
                      }
                    },
                    child: isEditing
                        ? Text(
                            'Editar',
                            style: const TextStyle(color: Colors.blue),
                          )
                        : Text(
                            'Adicionar',
                            style: const TextStyle(color: Colors.blue),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
