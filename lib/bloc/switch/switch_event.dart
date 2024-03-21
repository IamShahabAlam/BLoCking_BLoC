import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
  @override
  List<Object?> get props => [];
}

class OnSwitchPress extends SwitchEvent {}

class OnSlideBodySlider extends SwitchEvent {
  final double? bodySliderValue;
  final double? borderSliderValue;
  const OnSlideBodySlider({this.bodySliderValue, this.borderSliderValue});

  @override
  List<Object> get props => [bodySliderValue!, borderSliderValue!];
}
