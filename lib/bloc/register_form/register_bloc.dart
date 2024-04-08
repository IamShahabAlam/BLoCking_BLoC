import 'package:bloc_app/model/register_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial()) {
    on<OnRegister>(_onRegister);
    on<OnLogout>(_onLogout);
  }

  void _onRegister(OnRegister event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      RegisterModel formData = event.regModel;
      if (formData.password.length < 5 || formData.age == 0 || formData.name.isEmpty || formData.city.isEmpty) {
        return emit(const RegisterFailure(errorMsg: 'Please fill each field'));
      }
      await Future.delayed(const Duration(seconds: 2),
          () => emit(RegisterSuccess(registerModel: formData, token: '==2L%00-${formData.name}-%==${formData.email}-${formData.age}==/LqzZ=1')));
    } catch (e) {
      emit(RegisterFailure(errorMsg: 'Error : $e'));
    }
  }

  void _onLogout(OnLogout event, Emitter<RegisterState> emit) async {
    try {
      emit(RegisterLoading());

      await Future.delayed(
        Duration(seconds: 2),
        () => emit(const RegisterInitial()),
      );
    } catch (e) {
      return emit(RegisterFailure(errorMsg: e.toString()));
    }
  }
}
