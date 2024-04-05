import 'package:bloc_app/cubit/counter/counter_cubit.dart';
import 'package:bloc_app/cubit/todo/todo_cubit.dart';
// import 'package:bloc_app/presentation/cubit/counter/counter_view.dart';
import 'package:bloc_app/presentation/cubit/todo/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Bloc dependencies --------------------
        //     BlocProvider(create: (_) => CounterBloc()),
        //     BlocProvider(create: (_) => SwitchBloc()),
        //     BlocProvider(
        //       create: (_) => ImagePickerBloc(ImagePickerUtils()),
        //     ),
        //     BlocProvider(create: (_) => ToDoBloc()),
        //     BlocProvider(
        //       create: (_) => FavoriteBloc(),
        //     ),
        //     BlocProvider(create: (_) => StoreBloc()),
        // Cubit dependencies --------------------

        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => ToDoCubit())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const TodoView()
          // CounterView()
          // StoreScreen()
          // FavoriteScreen()
          // ToDoListScreen()
          // ImagePickerScreen()
          // SwitchScreen()
          // CounterScreen(),
          // const EquatablePage(title: 'EQUATABLE'),
          ),
    );
  }
}
