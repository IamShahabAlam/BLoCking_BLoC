import 'package:bloc_app/model/store_model.dart';
import 'package:equatable/equatable.dart';

import '../../utils/enums.dart';

class StoreState extends Equatable {
  final List<StoreModel> products;
  final List<StoreModel> searchedProducts;
  final StoreStatus storeStatus;
  final String message;
  final String searchedText;
  const StoreState(
      {this.products = const [],
      this.storeStatus = StoreStatus.loading,
      this.message = '',
      this.searchedProducts = const [],
      this.searchedText = ''});

  StoreState copyWith(
      {List<StoreModel>? products, StoreStatus? storeStatus, String? message, List<StoreModel>? searchedProducts, String? searchedText}) {
    return StoreState(
        products: products ?? this.products,
        message: message ?? this.message,
        storeStatus: storeStatus ?? this.storeStatus,
        searchedProducts: searchedProducts ?? this.searchedProducts,
        searchedText: searchedText ?? this.searchedText);
  }

  @override
  List<Object?> get props => [products, storeStatus, message, searchedProducts, searchedText];
}
