import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class OnAddTodo extends ToDoEvent {
  final String task;
  const OnAddTodo({required this.task});

  @override
  List<Object> get props => [task];
}

class OnRemoveTodo extends ToDoEvent {
  final String task;
  const OnRemoveTodo({required this.task});

  @override
  List<Object> get props => [task];

// TODO: make a dynamic func to add/delete from string
}
