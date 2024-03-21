import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

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

class OnCommentUpdate extends SwitchEvent {
  final String comment;

  const OnCommentUpdate({required this.comment});

  @override
  List<Object> get props => [comment];
}
