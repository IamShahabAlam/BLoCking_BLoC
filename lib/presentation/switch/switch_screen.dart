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

TextEditingController commentController = TextEditingController();

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Switch Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.comment != current.comment,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 50.0,
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(),
                      child: TextField(
                        controller: commentController,
                        onChanged: (val) {
                          // context.read<SwitchBloc>().add(OnCommentUpdate(comment: val!));
                          print(state.comment);
                        },
                        onEditingComplete: () {
                          context.read<SwitchBloc>().add(OnCommentUpdate(comment: commentController.text));
                          print(state.comment);
                        },
                        onTapOutside: (_) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        decoration: const InputDecoration(
                            hintText: 'Type Comments',
                            labelText: 'Comments',
                            prefixIcon: Icon(
                              Icons.chat_outlined,
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                      )),
                  const SizedBox(height: 20),
                  Text(state.comment),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
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
                  subtitle: Text(state.isSwitchOn ? 'ON' : 'OFF'),
                );
              }),
          const SizedBox(height: 40.0),
          BlocBuilder<SwitchBloc, SwitchState>(buildWhen: (previous, current) {
            return previous.bodySliderValue != current.bodySliderValue || previous.borderSliderValue != current.borderSliderValue;
          }, builder: (context, state) {
            print('slider');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(state.bodySliderValue),
                        border: Border.all(
                          width: 15.0,
                          color: Theme.of(context).colorScheme.inverseSurface.withOpacity(state.borderSliderValue),
                        )),
                    child: Text(state.bodySliderValue.toStringAsFixed(2)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 15.0),
                  child: Text('Container Color'),
                ),
                Slider(
                  value: state.bodySliderValue,
                  onChanged: (val) {
                    context.read<SwitchBloc>().add(OnSlideBodySlider(bodySliderValue: val));
                    // print('Slider Value : ' + state.sliderValue.toString());
                  },
                  divisions: 5,
                  label: state.bodySliderValue.toString(),
                  thumbColor: Theme.of(context).colorScheme.secondary,
                ),

                // ------------------------

                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 15.0),
                  child: Text('Border Color'),
                ),
                Slider(
                  value: state.borderSliderValue,
                  onChanged: (val) {
                    context.read<SwitchBloc>().add(OnSlideBodySlider(borderSliderValue: val));
                    // print('Slider Value : ' + state.sliderValue.toString());
                  },
                  divisions: 5,
                  label: state.borderSliderValue.toString(),
                  thumbColor: Theme.of(context).colorScheme.inverseSurface,
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
