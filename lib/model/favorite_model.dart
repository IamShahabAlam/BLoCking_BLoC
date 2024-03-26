class FavoriteModel {
  final String name;
  final int id;
  final bool isFavorite, isSelected;

  const FavoriteModel({required this.name, required this.id, this.isFavorite = false, this.isSelected = false});

  FavoriteModel copyWith({String? name, int? id, bool? isFavorite, bool? isSelected}) {
    return FavoriteModel(
        name: name ?? this.name, id: id ?? this.id, isFavorite: isFavorite ?? this.isFavorite, isSelected: isSelected ?? this.isSelected);
  }
}
