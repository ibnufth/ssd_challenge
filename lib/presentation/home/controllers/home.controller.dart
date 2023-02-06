import 'package:get/get.dart';

import '../../../core/util/use_case.dart';
import '../../../domain/auth/use_case/check_auth.dart';
import '../../../domain/user/entity/user.dart';
import '../../../infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  final CheckAuth _checkAuth;

  Rx<User> activeUser = Rx(User.empty);
  RxBool isLoading = RxBool(false);
  RxInt currentPageIndex = RxInt(0);

  HomeController(this._checkAuth);

  @override
  void onInit() {
    _authenticationCheck();
    super.onInit();
  }

  void changePage(int pageIndex) {
    currentPageIndex.value = pageIndex;
  }

  void _authenticationCheck() async {
    final res = await _checkAuth(NoParams());
    res.fold(
      (l) {
        Get.offAllNamed(Routes.LOGIN);
      },
      (r) {
        activeUser.value = r;
      },
    );
  }
}
