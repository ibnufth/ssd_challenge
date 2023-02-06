import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget graph({
  required String title,
  required List<double> data,
  required List<double> indexY,
  required Color color,
}) {
  int listLength = data.length;
  if (data.length > indexY.length) {
    listLength = indexY.length;
  }
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        listLength == 0
            ? const Center(child: CircularProgressIndicator())
            : AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(
                          border: const Border(right: BorderSide(width: 1))),
                      lineBarsData: [
                        LineChartBarData(
                          color: color,
                          isCurved: true,
                          dotData: FlDotData(show: false),
                          spots: List.generate(
                            listLength,
                            (index) => FlSpot(
                              indexY[index],
                              data[index],
                            ),
                          ),
                        ),
                      ],
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 60,
                          ),
                        ),
                        bottomTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                        leftTitles: AxisTitles(),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    ),
  );
}
