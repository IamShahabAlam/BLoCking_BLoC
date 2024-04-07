part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {}

class OnRegister extends RegisterEvent {
  final String name, email, password, city;
  final num age;

  OnRegister({required this.name, required this.email, required this.password, required this.city, required this.age});
  @override
  List<Object?> get props => [name, email, password, city, age];
}

class OnLogout extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
