import 'package:flutter/material.dart';

import '../widgets/total_spending.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SpendingTypes(),
        // SpendingSummary(),
        // SpendingChart(),
        TotalSpending(),
      ],
    );
  }
}
