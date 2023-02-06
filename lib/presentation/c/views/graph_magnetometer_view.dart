import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/c.controller.dart';
import '../widget/sensor_graph.dart';

class GraphMagnetometerView extends GetView<CController> {
  const GraphMagnetometerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graph Magnetometer'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(
            () => graph(
              data: controller.magnetometerDataX,
              indexY: controller.indexYMagnetometer,
              color: Colors.yellow,
              title: "Magnetometer X",
            ),
          ),
          Obx(
            () => graph(
              data: controller.magnetometerDataY,
              indexY: controller.indexYMagnetometer,
              color: Colors.green,
              title: "Magnetometer Y",
            ),
          ),
          Obx(
            () => graph(
              data: controller.magnetometerDataZ,
              indexY: controller.indexYMagnetometer,
              color: Colors.purple,
              title: "Magnetometer Z",
            ),
          ),
        ],
      ),
    );
  }
}
