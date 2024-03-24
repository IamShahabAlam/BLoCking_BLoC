import 'package:bloc_app/bloc/todo_list/todo_list_bloc.dart';
import 'package:bloc_app/bloc/todo_list/todo_list_event.dart';
import 'package:bloc_app/bloc/todo_list/todo_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo list'),
      ),
      body: Column(
        children: [
          BlocBuilder<ToDoBloc, ToDoState>(
              buildWhen: (p, c) => p.todoList != c.todoList,
              builder: (context, state) {
                print(state.todoList.toString());
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.todoList.length,
                    itemBuilder: (_, index) {
                      if (state.todoList.isEmpty) {
                        return const Text('ToDo List is Empty');
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Theme.of(context).colorScheme.inversePrimary,
                            title: Text(state.todoList[index].toString()),
                            trailing: IconButton(
                                onPressed: () {
                                  context.read<ToDoBloc>().add(OnRemoveTodo(task: state.todoList[index]));
                                  // BlocProvider.of<ToDoBloc>(context).add(OnRemoveTodo(task: state.todoList[index]));
                                },
                                icon: const Icon(Icons.delete_outlined)),
                          ),
                        );
                      }
                    },
                  ),
                );
              })
        ],
      ),
      floatingActionButton: BlocBuilder<ToDoBloc, ToDoState>(builder: (_, state) {
        return FloatingActionButton(
          onPressed: () {
            context.read<ToDoBloc>().add(OnAddTodo(task: 'Task ${state.todoList.length}'));
            // BlocProvider.of<ToDoBloc>(context).add(OnAddTodo(task: 'Task ${state.todoList.length}'));
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
