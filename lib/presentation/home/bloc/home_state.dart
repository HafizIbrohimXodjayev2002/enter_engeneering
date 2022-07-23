part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeOnSortState extends HomeState {
  final bool onSort;

  const HomeOnSortState(this.onSort);

  @override
  List<Object> get props => [onSort];
}

class HomeOnSortColumnState extends HomeState {
  final bool ascending;
  final int columnIndex;

  const HomeOnSortColumnState(this.columnIndex, this.ascending);

  @override
  List<Object> get props => [columnIndex, ascending];
}

class HomeSortedState extends HomeState {
  @override
  List<Object> get props => [];
}