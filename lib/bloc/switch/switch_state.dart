import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class SwitchState extends Equatable {
  final bool isSwitchOn;
  final double bodySliderValue;
  final double borderSliderValue;
  final String comment;
  const SwitchState({this.isSwitchOn = false, this.bodySliderValue = 0.5, this.borderSliderValue = 0.2, this.comment = ''});

  SwitchState copyWith({bool? isSwitchOn, double? bodySliderValue, double? borderSliderValue, String? comment}) {
    return SwitchState(
      isSwitchOn: isSwitchOn ?? this.isSwitchOn,
      bodySliderValue: bodySliderValue ?? this.bodySliderValue,
      borderSliderValue: borderSliderValue ?? this.borderSliderValue,
      comment: comment ?? this.comment,
    );
  }

  @override
  List<Object?> get props => [isSwitchOn, bodySliderValue, borderSliderValue, comment];
// TODO: Try TextEditingController into a BLoC var
}
