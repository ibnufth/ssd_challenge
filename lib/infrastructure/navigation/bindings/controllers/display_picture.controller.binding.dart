import 'package:get/get.dart';

import '../../../../presentation/display_picture/controllers/display_picture.controller.dart';

class DisplayPictureControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisplayPictureController>(
      () => DisplayPictureController(),
    );
  }
}
