class FavoriteModel {
  final String name;
  final int id;
  final bool isFavorite, isSelected;

  const FavoriteModel({required this.name, required this.id, this.isFavorite = false, this.isSelected = false});
}
