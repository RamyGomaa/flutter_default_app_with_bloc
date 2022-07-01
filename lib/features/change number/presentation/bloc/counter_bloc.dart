import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int num;
  CounterBloc(this.num) : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncreased) {
        emit(CounterPressed(++num));
      } else if (event is CounterDecreased) {
        if (num != 0) emit(CounterPressed(--num));
      }
    });
  }
}
