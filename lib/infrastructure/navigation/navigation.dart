import 'package:get/get.dart';

import '../../presentation/auth/views/login_nfc_view.dart';
import '../../presentation/auth/views/login_view.dart';
import '../../presentation/auth/views/register_view.dart';
import '../../presentation/c/views/graph_accelerometer_view.dart';
import '../../presentation/c/views/graph_gyroscope_view.dart';
import '../../presentation/c/views/graph_magnetometer_view.dart';
import '../../presentation/c/views/maps_view.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: AuthControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_NFC,
      page: () => const LoginNfcView(),
      binding: AuthControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
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
