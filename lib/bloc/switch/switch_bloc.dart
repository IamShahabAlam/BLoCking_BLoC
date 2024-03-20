import 'package:bloc_app/bloc/switch/switch_event.dart';
import 'package:bloc_app/bloc/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<OnSwitchPress>(_onSwitchPress);
    on<OnSLideSlider>(_onSlideSlider);
  }

  _onSwitchPress(SwitchEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitchOn: !state.isSwitchOn));
  }

  _onSlideSlider(OnSLideSlider event, Emitter<SwitchState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
