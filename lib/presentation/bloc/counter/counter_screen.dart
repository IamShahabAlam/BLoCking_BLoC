import 'package:bloc_app/bloc/counter/counter_bloc.dart';
import 'package:bloc_app/bloc/counter/counter_event.dart';
import 'package:bloc_app/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.inversePrimary,
        centerTitle: true,
        title: const Text("Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (_, state) {
            return Text(state.counter.toString(), style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold));
          }),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                color: theme.inversePrimary,
                child: const Text('Increment'),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                color: theme.inversePrimary,
                child: const Text("Decrement"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
