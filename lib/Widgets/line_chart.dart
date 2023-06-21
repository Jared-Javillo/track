import 'package:codepan/resources/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:track/colors.dart';
import 'package:track/vector.dart';

class LineChart extends StatelessWidget {
  final List<Vector> data;

  const LineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final d = Dimension.of(context);
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      plotAreaBorderColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
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
      series: <SplineAreaSeries<Vector, String>>[
        SplineAreaSeries<Vector, String>(
          dataSource: data,
          xValueMapper: (Vector sales, _) => sales.x,
          yValueMapper: (Vector sales, _) => sales.y,
          color: AppColors.blueShadow.withOpacity(0.4),
          borderColor: AppColors.greenFont,
          borderWidth: d.at(2),
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: AppColors.greenFont,
            borderColor: AppColors.greenFont,
            shape: DataMarkerType.circle, // Show the data point markers
          ),
        )
      ],
    );
  }
}