// ignore_for_file: avoid_print

import 'package:bloc_app/bloc/favorite/favorite_state.dart';
import 'package:bloc_app/repository/favorite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/model/favorite_model.dart';
import 'package:equatable/equatable.dart';

part 'todo_state.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(const ToDoState());

  final favRepo = FavoriteRepository();

  Future fetchData() async {
    emit(state.copyWith(favListStatus: ListStatus.loading));
    var response = await favRepo.fetchFavoriteData();
    if (response.isNotEmpty) {
      emit(state.copyWith(favList: response, favListStatus: ListStatus.success));
    } else {
      emit(state.copyWith(favList: [], favListStatus: ListStatus.failure));
    }
  }

  markFavorite(int i) {
    List<FavoriteModel> tempFavList = List.from(state.favList);
    tempFavList[i] = tempFavList[i].copyWith(isFavorite: !tempFavList[i].isFavorite);
    emit(state.copyWith(favList: tempFavList));
  }

  markSelected(int i) {
    List<FavoriteModel> tempList = [...state.favList];
    tempList[i] = tempList[i].copyWith(isSelected: !tempList[i].isSelected);
    bool selectedFound = tempList.any((elem) => elem.isSelected == true);
    emit(state.copyWith(favList: tempList, selectedFound: selectedFound));
  }

  deleteSelected() {
    List<FavoriteModel> tempList = [...state.favList];
    tempList.removeWhere((elem) => elem.isSelected);
    anySelectedFound(tempList);
    emit(state.copyWith(favList: tempList));
  }

  selectAll() {
    List<FavoriteModel> tempList = [...state.favList];
    // / failed
    // tempList.forEach((elem) => elem.isSelected = true);
    /*
    for (var i = 0; i < tempList.length; i++) {
      // ask GPT why it's working
      tempList[i] = tempList[i].copyWith(isSelected: true);
    }
    */
    // gpt approach
    tempList = tempList.map((elem) => elem.copyWith(isSelected: true)).toList();
    // for each indexed
    // tempList.forEachIndexed((i, elem) => tempList[i] = elem.copyWith(isSelected: true));

    // anySelectedFound(tempList);
    emit(state.copyWith(favList: tempList));
  }

  deselectAll() {
    List<FavoriteModel> tempList = [...state.favList];
    // tempList.forEach((elem) => elem = elem.copyWith(isSelected: false));
    for (var i = 0; i < tempList.length; i++) {
      // ask GPT why it's working
      tempList[i] = tempList[i].copyWith(isSelected: false);
    }
    anySelectedFound(tempList);
    emit(state.copyWith(favList: tempList));
  }

  anySelectedFound(tempList) {
    bool selectedFound = tempList.any((elem) => elem.isSelected == true);
    emit(state.copyWith(selectedFound: selectedFound));
  }

  editToDo(int i, String newVal) {
    List<FavoriteModel> tempList = [...state.favList];
    tempList[i] = tempList[i].copyWith(name: newVal);
    emit(state.copyWith(favList: tempList));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('************ ERROR **************');
    print(error);
    print(stackTrace);
    super.onError(error, stackTrace);
  }
}
