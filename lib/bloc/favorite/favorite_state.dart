import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  final List favorite, selectedList;
  const FavoriteState({this.favorite = const [], this.selectedList = const []});

  FavoriteState copyWith({List? favorite, List? selectedList}) {
    return FavoriteState(favorite: favorite ?? this.favorite, selectedList: selectedList ?? this.selectedList);
  }

  @override
  List<Object?> get props => [favorite, selectedList];
}
