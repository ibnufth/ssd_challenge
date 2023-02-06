import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:synapsis_challenge/infrastructure/theme/ssd_theme.dart';

import 'controllers/a.controller.dart';

class AScreen extends GetView<AController> {
  const AScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width * .7,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(90),
                    bottomRight: Radius.circular(3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE, d MMMM yyyy', 'id')
                        .format(controller.now.value),
                    style: textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    DateFormat.Hms('id').format(controller.now.value),
                    style:
                        textTheme.displayMedium?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Accelerometer",
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: Get.find<SSDTheme>().containerDecoration,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("X", style: textTheme.titleMedium),
                              Text("Y", style: textTheme.titleMedium),
                              Text("Z", style: textTheme.titleMedium),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ": ${controller.accelerometerValue.value.x}",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                ": ${controller.accelerometerValue.value.y}",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                ": ${controller.accelerometerValue.value.z}",
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Gyroscope",
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: Get.find<SSDTheme>().containerDecoration,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("X", style: textTheme.titleMedium),
                              Text("Y", style: textTheme.titleMedium),
                              Text("Z", style: textTheme.titleMedium),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ": ${controller.gyroscopeValue.value.x}",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                ": ${controller.gyroscopeValue.value.y}",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                ": ${controller.gyroscopeValue.value.z}",
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Magnetometer",
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: Get.find<SSDTheme>().containerDecoration,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("X", style: textTheme.titleMedium),
                              Text("Y", style: textTheme.titleMedium),
                              Text("Z", style: textTheme.titleMedium),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ": ${controller.magnetometerValue.value.x}",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                ": ${controller.magnetometerValue.value.y}",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                ": ${controller.magnetometerValue.value.z}",
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "GPS Coordinate",
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: Get.find<SSDTheme>().containerDecoration,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Latitude", style: textTheme.titleMedium),
                              Text("Longitude", style: textTheme.titleMedium),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ": ${controller.latitude.value}",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                ": ${controller.longitude.value}",
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Battery Level",
                        style: textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            decoration:
                                Get.find<SSDTheme>().containerDecoration,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                color: colorScheme.primaryContainer,
                                minHeight: 30,
                                value: double.parse(controller
                                        .batteryLevel.value
                                        .toString()) /
                                    100,
                              ),
                            ),
                          ),
                          Text(
                            "${controller.batteryLevel.value} %",
                            style: textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
