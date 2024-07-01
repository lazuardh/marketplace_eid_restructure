import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  void nextPage(int totalPages, BuildContext context) {
    if (state.currentIndex < totalPages - 1) {
      emit(CounterInProgress(currentIndex: state.currentIndex + 1));
    } else {
      emit(CounterCompleted(currentIndex: state.currentIndex));
      // Navigate to the login page
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void skip(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
