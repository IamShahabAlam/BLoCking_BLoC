// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ToDoState extends Equatable {
  List todoList;
  ToDoState({this.todoList = const ['Task 0', 'Task 1']});

  ToDoState copyWith({List? todoList}) {
    return ToDoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}
