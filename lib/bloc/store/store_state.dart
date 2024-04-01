import 'package:bloc_app/model/store_model.dart';
import 'package:equatable/equatable.dart';

import '../../utils/enums.dart';

class StoreState extends Equatable {
  final List<StoreModel> products;
  final StoreStatus storeStatus;
  final String message;
  const StoreState({this.products = const [], this.storeStatus = StoreStatus.loading, this.message = ''});

  StoreState copyWith({List<StoreModel>? products, StoreStatus? storeStatus, String? message}) {
    return StoreState(products: products ?? this.products, message: message ?? this.message, storeStatus: storeStatus ?? this.storeStatus);
  }

  @override
  List<Object?> get props => [products, storeStatus, message];
}
