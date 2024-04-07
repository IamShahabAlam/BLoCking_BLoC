part of 'register_bloc.dart';

class RegisterState extends Equatable {
  // initial

  const RegisterState();
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  final String token;
  final RegisterModel registerModel;
  const RegisterSuccess({this.token = '', required this.registerModel});
  @override
  List<Object?> get props => [token, registerModel];
}

class RegisterFailure extends RegisterState {
  final String errorMsg;

  const RegisterFailure({this.errorMsg = ''});

  @override
  List<Object?> get props => [errorMsg];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}
