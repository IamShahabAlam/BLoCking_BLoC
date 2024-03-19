import 'package:flutter/material.dart';

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
          const Text('0', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {},
                color: theme.inversePrimary,
                child: const Text('Increment'),
              ),
              MaterialButton(
                onPressed: () {},
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
