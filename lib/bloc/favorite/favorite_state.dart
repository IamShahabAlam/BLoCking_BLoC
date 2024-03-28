import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavoriteState extends Equatable {
  final List favoriteList, selectedList;
  final ListStatus listStatus;
  const FavoriteState({this.favoriteList = const [], this.selectedList = const [], this.listStatus = ListStatus.loading});

  FavoriteState copyWith({List? favoriteList, List? selectedList, ListStatus? listStatus}) {
    return FavoriteState(
        favoriteList: favoriteList ?? this.favoriteList, selectedList: selectedList ?? this.selectedList, listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favoriteList, selectedList];
}
