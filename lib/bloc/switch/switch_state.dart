import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitchOn;
  final double sliderValue;
  const SwitchState({this.isSwitchOn = false, this.sliderValue = 0.5});

  SwitchState copyWith({bool? isSwitchOn, double? sliderValue}) {
    return SwitchState(isSwitchOn: isSwitchOn ?? this.isSwitchOn, sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  List<Object?> get props => [isSwitchOn, sliderValue];
}
