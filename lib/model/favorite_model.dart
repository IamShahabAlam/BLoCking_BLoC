// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final String name;
  final int id;
  bool isFavorite, isSelected;

  FavoriteModel({required this.name, required this.id, this.isFavorite = false, this.isSelected = false});

  FavoriteModel copyWith({String? name, int? id, bool? isFavorite, bool? isSelected}) {
    return FavoriteModel(
        name: name ?? this.name, id: id ?? this.id, isFavorite: isFavorite ?? this.isFavorite, isSelected: isSelected ?? this.isSelected);
  }

  @override
  List<Object?> get props => [id, name, isFavorite, isSelected];
}
