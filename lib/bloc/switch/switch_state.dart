import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitchOn;
  final double bodySliderValue;
  final double borderSliderValue;
  const SwitchState({this.isSwitchOn = false, this.bodySliderValue = 0.5, this.borderSliderValue = 0.2});

  SwitchState copyWith({bool? isSwitchOn, double? bodySliderValue, double? borderSliderValue}) {
    return SwitchState(
      isSwitchOn: isSwitchOn ?? this.isSwitchOn,
      bodySliderValue: bodySliderValue ?? this.bodySliderValue,
      borderSliderValue: borderSliderValue ?? this.borderSliderValue,
    );
  }

  @override
  List<Object?> get props => [isSwitchOn, bodySliderValue, borderSliderValue];
// TODO: Try TextEditingController into a BLoC var
}
