import 'dart:math';

import 'package:flutter/material.dart';

import '../bin/todo_bin.dart';
import '../models/todo_model.dart';
import '../widgets/todo_list_item.dart';

class ToDoListScreen extends StatefulWidget {
  ToDoListScreen({Key? key, required this.st}) : super(key: key);
  final String st;
  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController todoTaskController = TextEditingController();
  final TodoBin todoBin = TodoBin();

  List<TodoModel> todoTasks = [];

  TodoModel?
      deletedTodoTask; //Nullable because initially we don't have any task

  int?
      deletedTodoTaskPosition; //Retrieve the last deleted task position in the list

  String? errorText;

  @override
  void initState() {
    super.initState();
    todoBin.getTodoList().then((value) {
      setState(() {
        todoTasks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Results"),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent.shade100,
                  padding: EdgeInsets.all(14),
                ),
                onPressed: () {
                  // * Retrieving the inserted form field text
                  final taskTitle = 1 + Random().nextInt(10 - 1);

                  setState(() {
                    final newTask = TodoModel(
                      title: taskTitle.toString(),
                      dateTime: DateTime.now(),
                    );
                    // * Render the screen to add the list
                    todoTasks.add(newTask);
                    errorText = null;
                  });
                  // * Clears text field after pressing the ADD button
                  todoTaskController.clear();
                  // * Saving the updated todo list
                  todoBin.saveTodoTaskList(todoTasks);
                },
                child: Text(
                  "Show Result",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    for (TodoModel todo in todoTasks)
                      TodoListItem(
                        todoTask: todo,
                        onDelete: onDelete,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent.shade100,
                      padding: EdgeInsets.all(14),
                    ),
                    onPressed: todoTasks.isEmpty
                        ? null
                        : showDeleteTodosConfirmationDialog,
                    child: Text(
                      'Clear',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// * Deleting a task
  void onDelete(TodoModel todo) {
    deletedTodoTask = todo;

    deletedTodoTaskPosition = todoTasks.indexOf(todo);

    setState(() {
      // Removing from  the task from the list
      todoTasks.remove(todo);
    });
    // Saving the list after deleting
    todoBin.saveTodoTaskList(todoTasks);

    ScaffoldMessenger.of(context).clearSnackBars(); //Removing the last snackbar
// * Undo functionality through snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          textColor: const Color(0xff00d7f3),
          label: 'Undo',
          onPressed: () {
            setState(() {
              todoTasks.insert(deletedTodoTaskPosition!, deletedTodoTask!);
            });
            todoBin.saveTodoTaskList(todoTasks);
          },
        ),
        content: Text(
          'task removed successfully!',
        ),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Clear everything?',
        ),
        content: Text(
          'Are you sure you want to delete all the tasks?',
        ),
        actions: [
          // * Cancel button
          TextButton(
            style: TextButton.styleFrom(
              primary: Color(0xff00d7f3),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
            ),
          ),
          // * Clean All
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            child: Text(
              'Clean all',
            ),
          ),
        ],
      ),
    );
  }

// TODO: Criar um if...else para alertar ao usuario que nao tem nenhuma tarefa para poder fazer o clean all
  // * Clean (Delete) all todos
  void deleteAllTodos() {
    setState(() {
      // Removes all objects from this list
      todoTasks.clear();
    });
    todoBin.saveTodoTaskList(todoTasks);
  }
}
