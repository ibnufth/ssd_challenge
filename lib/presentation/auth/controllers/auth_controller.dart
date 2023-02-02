import 'package:get/get.dart';
import 'package:synapsis_challenge/domain/auth/use_case/login_use_case.dart';
import 'package:synapsis_challenge/domain/auth/use_case/regiter_use_case.dart';
import 'package:synapsis_challenge/domain/user/entity/user.dart';
import 'package:synapsis_challenge/infrastructure/navigation/routes.dart';

class AuthController extends GetxController {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;

  final email = "".obs;
  final password = "".obs;
  final name = "".obs;

  RxBool isLoading = RxBool(false);

  AuthController(this._registerUseCase, this._loginUseCase);

  void onEmailChanged(String value) => email.value = value;
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
        GetSnackBar(message: l.message);
      },
      (r) => Get.offNamed(Routes.HOME),
    );
  }

  void login() async {
    isLoading.value = true;
    final result = await _loginUseCase(LoginParams(
      email: email.value,
      password: password.value,
    ));
    isLoading.value = false;
    result.fold(
      (l) {
        GetSnackBar(message: l.message);
      },
      (r) => Get.offNamed(Routes.HOME),
    );
  }
}
