import 'package:bloc_app/bloc/counter/counter_bloc.dart';
import 'package:bloc_app/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_app/bloc/todo_list/todo_list_bloc.dart';
import 'package:bloc_app/presentation/favorite/favorite_screen.dart';
// import 'package:bloc_app/presentation/image_picker/image_picker_screen.dart';
// import 'package:bloc_app/presentation/switch/switch_screen.dart';
// import 'package:bloc_app/presentation/todo_list/todo_list_screen.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:bloc_app/utils/image_picker_utils/image_picker_utils.dart';
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
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(
          create: (_) => FavoriteBloc(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const FavoriteScreen()
          // ToDoListScreen()
          // ImagePickerScreen()
          // SwitchScreen()
          // CounterScreen(),
          // const EquatablePage(title: 'EQUATABLE'),
          ),
    );
  }
}
