// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EQUATABLE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isEqual = false;

  void onFloatingPress() {
    Man man1 = Man(name: 'Mojo Jojo', age: 18);
    Man man2 = Man(name: 'Mojo Jojo', age: 18);

    isEqual = man1 == man2;

    print(isEqual);

    print('-------------');
    print('man1 hashCode : ${man1.hashCode}');
    print('man2 hashCode : ${man2.hashCode}');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Is Obj1 is Equal to Obj2:',
            ),
            Text(
              '$isEqual',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingPress,
        tooltip: 'Object Equal Finder',
        child: const Icon(Icons.fitbit_rounded),
      ),
    );
  }
}

// Class created to make its instances and compare them with/without package
class Man {
  Man({required this.name, required this.age});

  final String name;
  final int age;

// method which helps to compare instances of a class.
// difficult to write for rich classes.
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Man && runtimeType == other.runtimeType && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode;
}
