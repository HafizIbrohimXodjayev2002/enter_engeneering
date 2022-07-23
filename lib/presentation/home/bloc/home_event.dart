part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeOnSortEvent extends HomeEvent {
  final bool onSort;

  const HomeOnSortEvent(this.onSort);

  @override
  List<Object> get props => [onSort];
}

class HomeOnSortColumnEvent extends HomeEvent {
  final bool ascending;
  final int columnIndex;

  const HomeOnSortColumnEvent(this.columnIndex, this.ascending);

  @override
  List<Object> get props => [columnIndex, ascending];
}