import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatablePage extends StatefulWidget {
  const EquatablePage({super.key, required this.title});
  final String title;

  @override
  State<EquatablePage> createState() => _EquatablePageState();
}

class _EquatablePageState extends State<EquatablePage> {
  bool isEqual = false;

  void onFloatingPress() {
    Man man1 = const Man(name: 'Mojo Jojo', age: 18);
    Man man2 = const Man(name: 'Mojo Jojo', age: 19);

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
// Extending with equatable
// it generates code itself to compare instances
class Man extends Equatable {
  const Man({required this.name, required this.age});

  final String name;
  final int age;
// override method and give all params in [].
  @override
  List<Object?> get props => [name, age];

// method which helps to compare instances of a class.
// difficult to write for rich classes.
  /*
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Man && runtimeType == other.runtimeType && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
  */
}
