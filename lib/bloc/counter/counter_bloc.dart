import 'package:bloc/bloc.dart';
import 'package:bloc_app/bloc/counter/counter_event.dart';
import 'package:bloc_app/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  _increment(CounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  _decrement(CounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter == 0 ? 0 : state.counter - 1));
  }
}
