import 'package:camera/camera.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import '../camera/camera.screen.dart';
import 'controllers/c.controller.dart';

class CScreen extends GetView<CController> {
  const CScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.GRAPH_ACCELEROMETER);
                },
                icon: const Icon(Icons.show_chart),
                label: const Text("Graph Accelerometer")),
            ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.GRAPH_GYROSCOPE);
                },
                icon: const Icon(Icons.show_chart),
                label: const Text("Graph Gyroscope")),
            ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.GRAPH_MAGNETOMETER);
                },
                icon: const Icon(Icons.show_chart),
                label: const Text("Graph Magnetometer")),
            ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed(Routes.MAPS);
                },
                icon: const Icon(Icons.map),
                label: const Text("Maps")),
            ElevatedButton.icon(
                onPressed: () async {
                  var cameras = await availableCameras();
                  Get.log("cameras $cameras");
                  var firstCamera = cameras.first;
                  Get.to(CameraScreen(cameraDescription: firstCamera));
                },
                icon: const Icon(Icons.camera_alt_rounded),
                label: const Text("Camera")),
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
}
