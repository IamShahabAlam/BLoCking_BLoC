import 'package:bloc_app/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.inversePrimary,
        centerTitle: true,
        title: const Text("Cubit Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (_, state) {
                return Text(state.toString());
              }),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  counterCubit.increment();
                },
                color: theme.inversePrimary,
                child: const Text('Increment'),
              ),
              MaterialButton(
                onPressed: () {
                  counterCubit.decrement();
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
