part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  final int currentIndex;
  const CounterState({this.currentIndex = 0});

  @override
  List<Object> get props => [currentIndex];
}

class CounterInitial extends CounterState {
  const CounterInitial({super.currentIndex});
}

class CounterInProgress extends CounterState {
  const CounterInProgress({required super.currentIndex});
}

class CounterCompleted extends CounterState {
  const CounterCompleted({required super.currentIndex});
}
