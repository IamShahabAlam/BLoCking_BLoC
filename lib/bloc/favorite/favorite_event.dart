import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFavoriteData extends FavoriteEvent {}

class MarkFavorite extends FavoriteEvent {
  final int index;
  MarkFavorite({required this.index});
  @override
  List<Object> get props => [index];
}

class MarkSelect extends FavoriteEvent {
  final int index;
  MarkSelect({required this.index});
  @override
  List<Object> get props => [index];
}

class DeleteSelectedItems extends FavoriteEvent {
  @override
  List<Object> get props => [];
}
