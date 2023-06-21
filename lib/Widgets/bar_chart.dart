import 'package:codepan/resources/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:track/Pages/track_sales_page.dart';
import 'package:track/colors.dart';
import 'package:track/vector.dart';

class BarChart extends StatelessWidget {
  final List<Vector> data;

  const BarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      plotAreaBorderColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        interval: 1,
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: d.at(8),
          fontWeight: FontWeight.w400,
          color: AppColors.grey300,
        ),
      ),
      primaryYAxis: NumericAxis(
        majorTickLines: const MajorTickLines(width: 0),
        axisLine: const AxisLine(width: 0),
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: d.at(8),
          fontWeight: FontWeight.w400,
          color: AppColors.grey300,
        ),
      ),
      series: <ChartSeries>[
        ColumnSeries<Vector, int>(
          dataSource: data,
          xValueMapper: (Vector data, _) => int.parse(data.x),
          yValueMapper: (Vector data, _) => data.y,
          width: (d.at(0.5)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(d.at(8)),
            topRight: Radius.circular(d.at(8)),
          ),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [AppColors.blueGreen, AppColors.greenLite],
            stops: [0.01, 0.99],
          ),
        ),
      ],
    );
  }
}