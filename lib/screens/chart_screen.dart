import 'package:flutter/material.dart';

import '../widgets/spending_summary.dart';
import '../widgets/spending_types.dart';
import '../widgets/total_spending.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: SpendingTypes(),
        ),
        SpendingSummary(),
        // SpendingChart(),
        TotalSpending(),
      ],
    );
  }
}
