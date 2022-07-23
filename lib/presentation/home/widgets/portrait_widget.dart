import 'package:eriell_company/presentation/home/bloc/home_bloc.dart';
import 'package:eriell_company/data/models/fake_data.dart';
import 'package:eriell_company/ui/themes/app_style.dart';
import 'package:eriell_company/core/dimensions.dart';
import 'package:eriell_company/core/constants.dart';
import 'package:eriell_company/gen/colors.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class PortraitWidget extends StatelessWidget {
  const PortraitWidget({
    Key? key,
    required this.radius,
    required this.bloc,
  }) : super(key: key);

  final double radius;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.paddingH12,
      physics: Constants.physics,
      children: [
        PieChart(
          chartLegendSpacing: 45,
          initialAngleInDegree: 0,
          dataMap: FakeData.dataMap,
          chartType: ChartType.disc,
          animationDuration: Constants.animationPieChart,
          colorList: const [ColorName.red, ColorName.green, ColorName.blue, ColorName.yellowOcher],
          chartRadius: radius,
          legendOptions: const LegendOptions(
            showLegendsInRow: true,
            legendPosition: LegendPosition.top,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
            decimalPlaces: 1,
            showChartValues: true,
            showChartValuesOutside: true,
            showChartValueBackground: false,
            showChartValuesInPercentage: false,
            chartValueStyle: AppStyle.interW500x12WBlack,
          ),
        ),
        Dimensions.vSpace40,
        SingleChildScrollView(
          physics: Constants.physics,
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              bool onSort = true;
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
      ],
    );
  }
}