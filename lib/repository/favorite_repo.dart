import 'package:bloc_app/model/favorite_model.dart';

class FavoriteRepository {
  Future fetchFavoriteData() async {
    var favoriteList = [];
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        favoriteList = List.generate(12, (i) => FavoriteModel(name: 'The Item $i', id: int.parse('00$i')));
      },
    );

    return favoriteList;
  }
}
