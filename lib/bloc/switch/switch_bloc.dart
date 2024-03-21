import 'package:bloc_app/bloc/switch/switch_event.dart';
import 'package:bloc_app/bloc/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<OnSwitchPress>(_onSwitchPress);
    on<OnSlideBodySlider>(_onSlideSlider);
  }

  _onSwitchPress(SwitchEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitchOn: !state.isSwitchOn));
  }

  _onSlideSlider(OnSlideBodySlider event, Emitter<SwitchState> emit) {
    emit(state.copyWith(bodySliderValue: event.bodySliderValue, borderSliderValue: event.borderSliderValue));
  }
}
