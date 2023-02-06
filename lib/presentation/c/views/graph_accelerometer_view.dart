import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/c.controller.dart';
import '../widget/sensor_graph.dart';

class GraphAccelerometerView extends GetView<CController> {
  const GraphAccelerometerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graph Accelerometer'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(
            () => graph(
              data: controller.accelerometerDataX,
              indexY: controller.indexYAccelerometer,
              color: Colors.red,
              title: "Accelerometer X",
            ),
          ),
          Obx(
            () => graph(
              data: controller.accelerometerDataY,
              indexY: controller.indexYAccelerometer,
              color: Colors.lime,
              title: "Accelerometer Y",
            ),
          ),
          Obx(
            () => graph(
              data: controller.accelerometerDataZ,
              indexY: controller.indexYAccelerometer,
              color: Colors.lightBlue,
              title: "Accelerometer Z",
            ),
          ),
        ],
      ),
    );
  }
}
