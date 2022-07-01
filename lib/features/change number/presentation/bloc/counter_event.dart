part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {}

class CounterIncreased extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class CounterDecreased extends CounterEvent {
  @override
  List<Object?> get props => [];
}
