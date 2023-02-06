import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:synapsis_challenge/presentation/c/controllers/c.controller.dart';

class AController extends GetxController {
  Rx<DateTime> now = Rx(DateTime.now());
  Rx<AccelerometerEvent> accelerometerValue = AccelerometerEvent(0, 0, 0).obs;
  Rx<GyroscopeEvent> gyroscopeValue = GyroscopeEvent(0, 0, 0).obs;
  Rx<MagnetometerEvent> magnetometerValue = MagnetometerEvent(0, 0, 0).obs;
  RxDouble latitude = RxDouble(0.0);
  RxDouble longitude = RxDouble(0.0);
  RxInt batteryLevel = RxInt(0);
  RxInt refreshRate = RxInt(1);
  RxInt periodic = RxInt(0);

  @override
  void onInit() {
    _updateTime();
    _updatePeriodicData();
    super.onInit();
  }

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      now.value = DateTime.now();
    });
  }

  void decreasePeriod() {
    if (refreshRate.value > 1) refreshRate.value--;
  }

  void increasePeriod() {
    if (refreshRate.value < 30) refreshRate.value++;
  }

  void _updatePeriodicData() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (periodic.value < refreshRate.value - 1) {
        periodic.value = periodic.value + 1;
      } else {
        _determinePosition();
        _determineBattery();
        _determineSensorAccelerometer();
        _determineSensorGyroscope();
        _determineSensorMagnetometer();
        periodic.value = 0;
      }
    });
  }

  void _determineSensorAccelerometer() async {
    accelerometerValue.value = await accelerometerEvents.first;
    Get.find<CController>().addDataAccelerometer(accelerometerValue.value);
  }

  void _determineSensorGyroscope() async {
    gyroscopeValue.value = await gyroscopeEvents.first;
    Get.find<CController>().addDataGyroscope(gyroscopeValue.value);
  }

  void _determineSensorMagnetometer() async {
    magnetometerValue.value = await magnetometerEvents.first;
    Get.find<CController>().addDataMagnetometer(magnetometerValue.value);
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;
  }

  void _determineBattery() async {
    var battery = Battery();
    batteryLevel.value = await battery.batteryLevel;
  }
}
