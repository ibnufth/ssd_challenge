import 'package:get/get.dart';
import 'package:synapsis_challenge/domain/auth/use_case/login_use_case.dart';
import 'package:synapsis_challenge/domain/auth/use_case/regiter_use_case.dart';
import 'package:synapsis_challenge/presentation/auth/controllers/auth_controller.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class AuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUseCase());
    Get.lazyPut(() => LoginUseCase());
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
