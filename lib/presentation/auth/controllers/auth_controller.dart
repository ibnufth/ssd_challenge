import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../core/util/use_case.dart';
import '../../../domain/auth/use_case/login_nfc.dart';
import '../../../domain/auth/use_case/login_use_case.dart';
import '../../../domain/auth/use_case/logout.dart';
import '../../../domain/auth/use_case/register_use_case.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../widget/snackbar.dart';

class AuthController extends GetxController {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final LoginNFCUseCase _loginNFC;
  final LogoutUseCase _logoutUseCase;

  RxBool isNFCAvailable = RxBool(false);
  
  final email = "".obs;
  final password = "".obs;
  final name = "".obs;

  RxBool isLoading = RxBool(false);
  RxBool isCheckingNFCAffability = RxBool(false);

  AuthController(this._registerUseCase, this._loginUseCase, this._loginNFC,
      this._logoutUseCase);

  void onEmailChanged(String value) => email.value = value;
  void onNameChanged(String value) => email.value = value;
  void onPasswordChanged(String value) => password.value = value;

  void register() async {
    isLoading.value = true;
    final result = await _registerUseCase(RegisterParams(
      name: name.value,
      email: email.value,
      password: password.value,
    ));
    isLoading.value = false;
    result.fold(
      (l) {
        Get.log(l.message);
        showWarningSnackbar(l.message);
      },
      (r) => Get.offAllNamed(Routes.HOME),
    );
  }

  void login() async {
    Get.log("login called");
    isLoading.value = true;
    final result = await _loginUseCase(LoginParams(
      email: email.value,
      password: password.value,
    ));
    isLoading.value = false;
    result.fold(
      (l) {
        showWarningSnackbar(l.message);
      },
      (r) => Get.offAllNamed(Routes.HOME),
    );
  }

  initNFC() async {
    isCheckingNFCAffability.value = true;
    isNFCAvailable.value = await NfcManager.instance.isAvailable();
    isCheckingNFCAffability.value = false;
    if (isNFCAvailable.value) {
      Get.log("isNFCAvailable ${isNFCAvailable.value}");
      tagRead();
    }
  }

  void tagRead() {
    Map result;
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        result = tag.data;
        final res = await _loginNFC(result);
        res.fold(
          (l) => null,
          (r) {
            Get.offAllNamed(Routes.HOME);
          },
        );

        NfcManager.instance.stopSession();
      },
    );
  }

  void logout() async {
    final res = await _logoutUseCase(NoParams());
    res.fold((l) {
      showWarningSnackbar(l.message);
    }, (r) {
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}
