import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpendingChart extends StatelessWidget {
  const SpendingChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ChartHeader(),
        Expanded(child: _Chart()),
      ],
    );
  }
}

class _ChartHeader extends StatelessWidget {
  const _ChartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Expenditures Chart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Fast Analysis',
                style: TextStyle(color: Colors.black38),
              ),
            ],
          ),
        ),
        Material(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: PopupMenuButton(
            itemBuilder: (context) {
              return popupOptions
                  .map((option) => PopupMenuItem(child: Text(option)))
                  .toList();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: Row(
                children: [
                  Text(popupOptions[0]),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        // remove background grid
        gridData: FlGridData(show: false),
        // remove the borders
        borderData: FlBorderData(
          show: false,
        ),
        // titles
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final day = spendings[value.toInt()].day;
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(day),
                );
              },
            ),
          ),
        ),
        maxY: maxValue.toDouble(),
        barGroups: [
          for (int i = 0; i < spendings.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: spendings[i].spending.toDouble(),
                ),
              ],
            )
        ],
      ),
    );
  }
}

final popupOptions = <String>[
  'Weekly',
  'Monthly',
  'Yearly',
];

class DailySpending {
  DailySpending(this.day, this.spending);

  final String day;
  final int spending;
}

final spendings = <DailySpending>[
  DailySpending('Mo', 12500),
  DailySpending('Tu', 2500),
  DailySpending('We', 1200),
  DailySpending('Th', 12000),
  DailySpending('Fr', 2500),
  DailySpending('Sa', 1500),
  DailySpending('Su', 15500),
];

final maxValue = spendings.map((e) => e.spending).reduce(max);
