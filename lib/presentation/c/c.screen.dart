import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:oscilloscope/oscilloscope.dart';
import 'package:synapsis_challenge/infrastructure/navigation/routes.dart';

import 'controllers/c.controller.dart';

class CScreen extends GetView<CController> {
  CScreen({Key? key}) : super(key: key);

  final List<Color> listColor = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lime,
    Colors.lightGreen,
    Colors.green,
    Colors.lightBlue,
    Colors.blue,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            FilledButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.GRAPH_ACCELEROMETER);
                },
                icon: const Icon(Icons.show_chart),
                label: const Text("Graph Accelerometer")),
            const SizedBox(height: 8),
            FilledButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.GRAPH_GYROSCOPE);
                },
                icon: const Icon(Icons.show_chart),
                label: const Text("Graph Gyroscope")),
            const SizedBox(height: 8),
            FilledButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.GRAPH_MAGNETOMETER);
                },
                icon: const Icon(Icons.show_chart),
                label: const Text("Graph Magnetometer")),
            const SizedBox(height: 8),
            FilledButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.MAPS);
                },
                icon: const Icon(Icons.map),
                label: const Text("Maps")),
          ],
        ),
      ),
    );
  }

  Widget chart({
    required List<double> data,
    required List<double> indexY,
    required Color color,
    required String title,
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
          AspectRatio(
            aspectRatio: 1.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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

  Oscilloscope scope(List<double> data, Color color) => Oscilloscope(
        showYAxis: true,
        yAxisColor: Colors.white,
        margin: const EdgeInsets.all(20.0),
        strokeWidth: 1.0,
        backgroundColor: Colors.white,
        traceColor: color,
        yAxisMax: 1.0,
        yAxisMin: -1.0,
        dataSet: data,
      );
}

                        // LineChartBarData(
                        //   color: Colors.blue,
                        //   isCurved: true,
                        //   dotData: FlDotData(show: false),
                        //   spots: List.generate(
                        //     controller.accelerometerDataY.length,
                        //     (index) => FlSpot(
                        //       controller.indexY[index],
                        //       controller.accelerometerDataY[index],
                        //     ),
                        //   ),
                        // ),
                        // LineChartBarData(
                        //   color: Colors.red,
                        //   isCurved: true,
                        //   dotData: FlDotData(show: false),
                        //   spots: List.generate(
                        //     controller.accelerometerDataZ.length,
                        //     (index) => FlSpot(
                        //       controller.indexY[index],
                        //       controller.accelerometerDataZ[index],
                        //     ),
                        //   ),
                        // ),