part of 'todo_cubit.dart';

class ToDoState extends Equatable {
  final List<FavoriteModel> favList;
  final bool selectedFound;
  final favListStatus;
  const ToDoState({this.favList = const [], this.selectedFound = false, this.favListStatus = ListStatus.loading});

  ToDoState copyWith({List<FavoriteModel>? favList, bool? selectedFound, ListStatus? favListStatus}) {
    return ToDoState(
        favList: favList ?? this.favList, selectedFound: selectedFound ?? this.selectedFound, favListStatus: favListStatus ?? this.favListStatus);
  }

  @override
  List<Object?> get props => [favList, selectedFound, favListStatus];
}
