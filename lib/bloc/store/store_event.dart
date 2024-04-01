import 'package:equatable/equatable.dart';

abstract class StoreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductsData extends StoreEvent {
  @override
  List<Object> get props => [];
}

class FilterSearch extends StoreEvent {
  final String searchedText;
  FilterSearch({required this.searchedText});
  @override
  List<Object> get props => [];
}
