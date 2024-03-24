import 'package:bloc/bloc.dart';
import 'package:bloc_app/bloc/todo_list/todo_list_event.dart';
import 'package:bloc_app/bloc/todo_list/todo_list_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  List todos = [];
  ToDoBloc() : super(ToDoState()) {
    todos = List.from(state.todoList);
    on<OnAddTodo>(_onAddToDo);
    on<OnRemoveTodo>(_onRemoveToDo);
  }

  void _onAddToDo(OnAddTodo event, Emitter<ToDoState> emit) {
    // 1st approach
    /*
    state.todoList.add(event.task);
    List tempList = state.todoList;

    // 2nd approach

    List tempList = state.todoList;
    tempList.add(event.task);
*/
    // 3rd approach
    // todos = List.from(state.todoList);
    todos.add(event.task);

    emit(state.copyWith(todoList: List.from(todos)));
  }

  _onRemoveToDo(OnRemoveTodo event, Emitter<ToDoState> emit) {
    // List tempList = List.from(state.todoList);
    todos.remove(event.task);
    emit(state.copyWith(todoList: List.from(todos)));
  }
}
