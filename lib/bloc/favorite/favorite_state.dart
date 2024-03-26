import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  final List favoriteList, selectedList;
  const FavoriteState({this.favoriteList = const [], this.selectedList = const []});

  FavoriteState copyWith({List? favoriteList, List? selectedList}) {
    return FavoriteState(favoriteList: favoriteList ?? this.favoriteList, selectedList: selectedList ?? this.selectedList);
  }

  @override
  List<Object?> get props => [favoriteList, selectedList];
}
