import 'package:bloc_app/bloc/store/store_event.dart';
import 'package:bloc_app/bloc/store/store_state.dart';
import 'package:bloc_app/model/store_model.dart';
import 'package:bloc_app/repository/store_repo.dart';
import 'package:bloc_app/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreRepo storeRepo = StoreRepo();
  StoreBloc() : super(const StoreState()) {
    on<FetchProductsData>(_fetchProductsData);
    on<FilterSearch>(_filterSearch);
  }

  _fetchProductsData(FetchProductsData event, Emitter<StoreState> emit) async {
    emit(state.copyWith(storeStatus: StoreStatus.loading));

    await storeRepo.getProductData().then((value) => emit(state.copyWith(products: value, storeStatus: StoreStatus.success)));
  }

  _filterSearch(FilterSearch event, Emitter<StoreState> emit) {
    List<StoreModel> tempProducts = [];
    tempProducts = state.products.where((element) => element.title!.toLowerCase().contains(event.searchedText.toLowerCase())).toList();

    emit(state.copyWith(searchedProducts: List.from(tempProducts), searchedText: event.searchedText));
  }
}
