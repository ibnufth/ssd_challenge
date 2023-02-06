import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/c.controller.dart';
import '../widget/sensor_graph.dart';

class GraphGyroscopeView extends GetView<CController> {
  const GraphGyroscopeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graph Gyroscope'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(
            () => graph(
              data: controller.gyroscopeDataX,
              indexY: controller.indexYGyroscope,
              color: Colors.orange,
              title: "Gyroscope X",
            ),
          ),
          Obx(
            () => graph(
              data: controller.gyroscopeDataY,
              indexY: controller.indexYGyroscope,
              color: Colors.lightGreen,
              title: "Gyroscope Y",
            ),
          ),
          Obx(
            () => graph(
              data: controller.gyroscopeDataZ,
              indexY: controller.indexYGyroscope,
              color: Colors.blue,
              title: "Gyroscope Z",
            ),
          ),
        ],
      ),
    );
  }
}
