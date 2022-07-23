import 'package:eriell_company/data/models/fake_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeOnSortEvent>((event, emit) {
      onSort(event.onSort);
    });
    on<HomeOnSortColumnEvent>((event, emit) {
      onSortColumnIndex(event.columnIndex, event.ascending);
    });
  }

  final ScrollController horizontalScroll = ScrollController(), verticalScroll = ScrollController();

  final datas = FakeData.getData();

  void onSort(bool onSort) {
    emit(HomeOnSortState(onSort));
  }

  void onSortColumnIndex(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      datas.sort(((data1, data2) => compareString(ascending, "${data1.id}", "${data2.id}")));
    }
  }

  int compareString(bool ascending, String data1, String data2) {
    return ascending ? data1.compareTo(data2) : data2.compareTo(data1);
  }
}
