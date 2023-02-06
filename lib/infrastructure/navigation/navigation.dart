import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:synapsis_challenge/presentation/c/views/graph_gyroscope_view.dart';
import 'package:synapsis_challenge/presentation/c/views/graph_magnetometer_view.dart';
import 'package:synapsis_challenge/presentation/c/views/maps_view.dart';

import '../../config.dart';
import '../../presentation/auth/views/login_nfc_view.dart';
import '../../presentation/auth/views/login_view.dart';
import '../../presentation/auth/views/register_view.dart';
import '../../presentation/c/views/graph_accelerometer_view.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_NFC,
      page: () => const LoginNfcView(),
      binding: AuthControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: AuthControllerBinding(),
    ),
    GetPage(
      name: Routes.GRAPH_ACCELEROMETER,
      page: () => const GraphAccelerometerView(),
    ),
    GetPage(
      name: Routes.GRAPH_GYROSCOPE,
      page: () => const GraphGyroscopeView(),
    ),
    GetPage(
      name: Routes.GRAPH_MAGNETOMETER,
      page: () => const GraphMagnetometerView(),
    ),
    GetPage(
      name: Routes.MAPS,
      page: () => const MapsView(),
    ),
  ];
}
