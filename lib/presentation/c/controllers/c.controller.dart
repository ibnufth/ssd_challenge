import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../a/controllers/a.controller.dart';

class CController extends GetxController {
  RxList<double> accelerometerDataX = RxList([]);
  RxList<double> accelerometerDataY = RxList([]);
  RxList<double> accelerometerDataZ = RxList([]);
  RxList<double> gyroscopeDataX = RxList([]);
  RxList<double> gyroscopeDataY = RxList([]);
  RxList<double> gyroscopeDataZ = RxList([]);
  RxList<double> magnetometerDataX = RxList([]);
  RxList<double> magnetometerDataY = RxList([]);
  RxList<double> magnetometerDataZ = RxList([]);

  RxList<double> indexYAccelerometer = RxList([]);
  RxList<double> indexYGyroscope = RxList([]);
  RxList<double> indexYMagnetometer = RxList([]);
  double i = 0;
  double j = 0;
  double k = 0;

  late LatLng initMapPosition;

  @override
  void onInit() {
    initMapPosition = LatLng(Get.find<AController>().latitude.value,
        Get.find<AController>().latitude.value);
    super.onInit();
  }

  addDataAccelerometer(AccelerometerEvent value) {
    if (accelerometerDataX.length > 29) {
      accelerometerDataX.removeAt(0);
      accelerometerDataY.removeAt(0);
      accelerometerDataZ.removeAt(0);
      indexYAccelerometer.remove(0);
    }
    accelerometerDataX.add(value.x);
    accelerometerDataY.add(value.y);
    accelerometerDataZ.add(value.z);
    indexYAccelerometer.add(i);
    i++;
  }

  addDataMagnetometer(MagnetometerEvent value) {
    if (accelerometerDataX.length > 29) {
      magnetometerDataX.removeAt(0);
      magnetometerDataY.removeAt(0);
      magnetometerDataZ.removeAt(0);
      indexYMagnetometer.add(j);
    }
    magnetometerDataX.add(value.x);
    magnetometerDataY.add(value.y);
    magnetometerDataZ.add(value.z);
    j++;
  }

  addDataGyroscope(GyroscopeEvent value) {
    if (accelerometerDataX.length > 29) {
      gyroscopeDataX.removeAt(0);
      gyroscopeDataY.removeAt(0);
      gyroscopeDataZ.removeAt(0);
      indexYGyroscope.add(k);
    }
    gyroscopeDataX.add(value.x);
    gyroscopeDataY.add(value.y);
    gyroscopeDataZ.add(value.z);
    k++;
  }
}
