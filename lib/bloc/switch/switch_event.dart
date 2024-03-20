import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
  @override
  List<Object?> get props => [];
}

class OnSwitchPress extends SwitchEvent {}

class OnSLideSlider extends SwitchEvent {
  final double sliderValue;
  const OnSLideSlider({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];
}
