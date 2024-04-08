part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {}

class OnRegister extends RegisterEvent {
  // final String name, email, password, city;
  // final num age;

  // OnRegister({required this.name, required this.email, required this.password, required this.city, required this.age});
  final RegisterModel regModel;
  OnRegister({required this.regModel});
  @override
  List<Object?> get props => [regModel];
}

class OnLogout extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
