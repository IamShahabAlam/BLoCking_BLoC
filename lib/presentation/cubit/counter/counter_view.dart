import 'package:bloc_app/cubit/counter/counter_cubit.dart';
import 'package:bloc_app/presentation/cubit/counter/counter_update_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  // direct instance without MultiProvider in main.dart.
  // final counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    // Linked instance with MultiProvider in main.dart.
    final counterCubit = BlocProvider.of<CounterCubit>(context);
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
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 45.0),
                );
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
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CounterUpdateView())),
          child: const Icon(Icons.navigate_next)),
    );
  }
}
