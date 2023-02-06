import 'package:get/get.dart';
import 'package:synapsis_challenge/domain/auth/use_case/check_auth.dart';
import 'package:synapsis_challenge/domain/qr/use_case/add_qr.dart';
import 'package:synapsis_challenge/domain/qr/use_case/delete_qr.dart';
import 'package:synapsis_challenge/domain/qr/use_case/get_list_qr.dart';
import 'package:synapsis_challenge/domain/qr/use_case/update_qr.dart';

import '../../../../presentation/a/controllers/a.controller.dart';
import '../../../../presentation/b/controllers/b.controller.dart';
import '../../../../presentation/c/controllers/c.controller.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckAuth());
    Get.lazyPut(() => GetQRListUseCase());
    Get.lazyPut(() => AddQRUseCase());
    Get.lazyPut(() => UpdateQRUseCase());
    Get.lazyPut(() => DeleteQRUseCase());
    Get.lazyPut<AController>(() => AController(), fenix: true);
    Get.lazyPut<BController>(() => BController(), fenix: true);
    Get.lazyPut<CController>(() => CController(), fenix: true);
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
