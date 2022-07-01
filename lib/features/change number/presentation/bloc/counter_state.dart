part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  final int num = 0;

  @override
  List<Object?> get props => [num];
}

class CounterInitial extends CounterState {
  @override
  final int num = 0;

  @override
  List<Object?> get props => [num];
}

class CounterPressed extends CounterState {
  @override
  final int num;
  CounterPressed(this.num);
  @override
  List<Object?> get props => [num];
}
