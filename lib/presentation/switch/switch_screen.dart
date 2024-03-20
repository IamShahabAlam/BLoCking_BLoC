import 'package:bloc_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_app/bloc/switch/switch_event.dart';
import 'package:bloc_app/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.isSwitchOn != current.isSwitchOn,
              builder: (context, state) {
                print('Switch');
                return SwitchListTile(
                  value: state.isSwitchOn,
                  onChanged: (val) {
                    context.read<SwitchBloc>().add(OnSwitchPress());
                  },
                  title: const Text("Switch BLoC"),
                  subtitle: Text(state.isSwitchOn.toString()),
                );
              }),
          BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                print('slider');
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 250,
                      color: Theme.of(context).colorScheme.primary.withOpacity(state.sliderValue),
                      child: Text(state.sliderValue.toStringAsFixed(2)),
                    ),
                    Slider(
                        value: state.sliderValue,
                        onChanged: (val) {
                          context.read<SwitchBloc>().add(OnSLideSlider(sliderValue: val));
                          // print('Slider Value : ' + state.sliderValue.toString());
                        }),
                  ],
                );
              })
        ],
      ),
    );
  }
}
