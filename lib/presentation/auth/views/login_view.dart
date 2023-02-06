import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:synapsis_challenge/infrastructure/navigation/routes.dart';
import 'package:synapsis_challenge/presentation/auth/controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  LoginView({Key? key}) : super(key: key);
  final formKeyLogin = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: formKeyLogin,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Login',
                      style: textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  FormBuilderTextField(
                    onChanged: (value) =>
                        controller.onEmailChanged(value ?? ''),
                    name: "email",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    onChanged: (value) =>
                        controller.onPasswordChanged(value ?? ''),
                    obscureText: true,
                    name: "password",
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (formKeyLogin.currentState?.saveAndValidate() ??
                            false) {
                          controller.login();
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Center(child: Text('Or Login With')),
                  const SizedBox(
                    height: 50,
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      controller.initNFC();
                      Get.toNamed(Routes.LOGIN_NFC);
                    },
                    icon: const Icon(Icons.nfc),
                    label: const Text("NFC"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Center(child: Text('Or register')),
                  TextButton(
                    onPressed: () async {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: const Text('Register'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
