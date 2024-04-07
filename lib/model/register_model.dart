import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String name, email, password, city;
  final num age;

  const RegisterModel({this.name = '', this.email = '', this.password = '', this.city = '', this.age = 0});

  RegisterModel copyWith(String? name, String? email, String? password, String? city, num? age) {
    return RegisterModel(
        name: name ?? this.name, email: email ?? this.email, password: password ?? this.password, city: city ?? this.city, age: age ?? this.age);
  }

  @override
  List<Object?> get props => [name, email, password, city, age];
}
