// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print('BLoc Created ***: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('BLoc ERROR ***: ${bloc.runtimeType} \n Error - $error \n StackTrace $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('BLoc EVENT ***: ${bloc.runtimeType} \n Event : - $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('BLoc Transition ***: ${bloc.runtimeType} \n Transition - $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('BLoc changed ***: ${bloc.runtimeType} \nchanged - $change');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    print('BLoc CLosed ***: ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
