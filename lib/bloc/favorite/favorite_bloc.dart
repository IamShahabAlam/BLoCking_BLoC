import 'package:bloc_app/bloc/favorite/favorite_event.dart';
import 'package:bloc_app/bloc/favorite/favorite_state.dart';
import 'package:bloc_app/repository/favorite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<FetchFavoriteData>(_fetchFavoriteData);
    on<MarkFavorite>(_markFavorite);
    // on<MarkSelect>();
  }
  _fetchFavoriteData(FavoriteEvent event, Emitter<FavoriteState> emit) async {
    FavoriteRepository favRepo = FavoriteRepository();
    var resp = await favRepo.fetchFavoriteData();
    emit(state.copyWith(favoriteList: List.from(resp)));
  }

  _markFavorite(MarkFavorite event, Emitter<FavoriteState> emit) {
    int i = event.index;
    List favList = List.from(state.favoriteList);
    favList[i].isFavorite = !favList[i].isFavorite;

    emit(state.copyWith(favoriteList: List.from(favList)));
  }
}
