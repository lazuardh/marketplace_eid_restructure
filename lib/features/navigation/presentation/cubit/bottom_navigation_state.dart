part of 'bottom_navigation_cubit.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitial extends BottomNavigationState {}

class BottomNavigationChangedIndex extends BottomNavigationState {
  final int selectedIndex;

  const BottomNavigationChangedIndex({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
