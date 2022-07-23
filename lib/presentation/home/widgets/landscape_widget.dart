import 'package:eriell_company/core/constants.dart';
import 'package:eriell_company/presentation/home/bloc/home_bloc.dart';
import 'package:eriell_company/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LandscapeWidget extends StatelessWidget {
  final HomeBloc bloc;

  const LandscapeWidget({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      controller: bloc.verticalScroll,
      thumbVisibility: true,
      child: CupertinoScrollbar(
        controller: bloc.horizontalScroll,
        thumbVisibility: true,
        notificationPredicate: (notif) => notif.depth == 1,
        child: SingleChildScrollView(
          physics: Constants.physics,
          controller: bloc.verticalScroll,
          child: SingleChildScrollView(
            physics: Constants.physics,
            controller: bloc.horizontalScroll,
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                bool onSort = false;
                if (state is HomeOnSortState) {
                  onSort = state.onSort;
                }
                return DataTable(
                  sortAscending: onSort,
                  sortColumnIndex: 0,
                  columnSpacing: 38,
                  border: const TableBorder(
                      verticalInside: BorderSide(color: ColorName.black),
                      horizontalInside: BorderSide(
                        color: ColorName.black,
                      )),
                  columns: [
                    DataColumn(
                      onSort: (columnIndex, ascending) {
                        bloc.add(HomeOnSortEvent(!onSort));
                        bloc.add(HomeOnSortColumnEvent(columnIndex, ascending));
                      },
                      label: const Text("№"),
                    ),
                    const DataColumn(
                      label: Text("Компания"),
                    ),
                    const DataColumn(
                      label: Text("Доходы (USD)"),
                    ),
                    const DataColumn(
                      label: Text("Сотрудники"),
                    ),
                    const DataColumn(
                      label: Text("В рынке"),
                    ),
                    const DataColumn(
                      label: Text("Техники"),
                    ),
                    const DataColumn(
                      label: Text("Директоры"),
                    ),
                  ],
                  rows: bloc.datas
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(
                              Text(data.id.toString()),
                            ),
                            DataCell(
                              Text(data.company),
                            ),
                            DataCell(
                              Text(data.incomes),
                            ),
                            DataCell(
                              Text(data.employees),
                            ),
                            DataCell(
                              Text(data.inMarket),
                            ),
                            DataCell(
                              Text(data.techniques),
                            ),
                            DataCell(
                              Text(data.directors),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}