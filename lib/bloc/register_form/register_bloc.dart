import 'package:bloc_app/model/register_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<OnRegister>(_onRegister);
    on<OnLogout>(_onLogout);
  }

  void _onRegister(OnRegister event, Emitter<RegisterState> emit) {}
  void _onLogout(OnLogout event, Emitter<RegisterState> emit) {}
}
