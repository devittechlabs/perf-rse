import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/size.dart';

class ChartOverview extends StatelessWidget {
  const ChartOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "150",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text("sur 450 indicateurs",style: Theme.of(context).textTheme.bodySmall,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: Colors.green,
    value: 40,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Colors.amber,
    value: 60,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Colors.red,
    value: 100,
    showTitle: false,
    radius: 16,
  ),
];
