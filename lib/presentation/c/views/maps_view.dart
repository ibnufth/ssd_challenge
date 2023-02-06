import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:synapsis_challenge/presentation/c/controllers/c.controller.dart';

class MapsView extends GetView<CController> {
  const MapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapsView'),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: controller.initMapPosition,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.challenge.synapsis.synapsis_challenge',
          ),
        ],
      ),
    );
  }
}
