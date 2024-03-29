// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bloc_app/bloc/favorite/favorite_event.dart';
import 'package:bloc_app/bloc/favorite/favorite_state.dart';
import 'package:bloc_app/model/favorite_model.dart';
import 'package:bloc_app/repository/favorite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<FetchFavoriteData>(_fetchFavoriteData);
    on<MarkFavorite>(_markFavorite);
    on<MarkSelect>(_markSelect);
    on<DeleteSelectedItems>(_deleteSelectedItem);
  }
  _fetchFavoriteData(FavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(favoriteList: [], listStatus: ListStatus.loading));
    FavoriteRepository favRepo = FavoriteRepository();
    var resp = await favRepo.fetchFavoriteData();
    emit(state.copyWith(favoriteList: List.from(resp), listStatus: ListStatus.success));
  }

  _markFavorite(MarkFavorite event, Emitter<FavoriteState> emit) {
    int i = event.index;
    List<FavoriteModel> favList = List.from(state.favoriteList);
    // 1st approach
    // dont know why it is not working , will figure it out soon
    // favList[i].isFavorite = !(favList[i].isFavorite);
    // 2nd approach
    // Toggle the favorite status of the item at index i
    favList[i] = favList[i].copyWith(isFavorite: !favList[i].isFavorite);

    emit(state.copyWith(favoriteList: List.from(favList)));
  }

  _markSelect(MarkSelect event, Emitter<FavoriteState> emit) {
    int i = event.index;
    List<FavoriteModel> favList = List.from(state.favoriteList);
    List<FavoriteModel> selectedList = List.from(state.selectedList);
    selectedList.contains(favList[i]) ? selectedList.remove(favList[i]) : selectedList.add(favList[i]);
    favList[i] = favList[i].copyWith(isSelected: !favList[i].isSelected);

    // favList[i].isSelected = !(favList[i].isSelected);
    emit(state.copyWith(favoriteList: List.from(favList), selectedList: List.from(selectedList)));
  }

  _deleteSelectedItem(FavoriteEvent event, Emitter<FavoriteState> emit) {
    List<FavoriteModel> favList = List.from(state.favoriteList);
    List<FavoriteModel> selectedList = List.from(state.selectedList);
    // favList.forEach((elem) {
    //   elem.isSelected ? favList.remove(elem) : null;
    // });

    favList.removeWhere((e) => e.isSelected == true);
    selectedList = [];

    emit(state.copyWith(favoriteList: List.from(favList), selectedList: List.from(selectedList)));
  }
}
