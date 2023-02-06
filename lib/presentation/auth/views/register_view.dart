import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:synapsis_challenge/presentation/auth/controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: LoadingOverlay(
          isLoading: controller.isLoading.value,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKeyRegister,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Registration",
                        style: textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    FormBuilderTextField(
                      name: "name",
                      onChanged: (value) =>
                          controller.onNameChanged(value ?? ''),
                      decoration: const InputDecoration(
                        labelText: "Name",
                      ),
                      validator: FormBuilderValidators.required(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'email',
                      onChanged: (value) =>
                          controller.onEmailChanged(value ?? ''),
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'password',
                      onChanged: (value) =>
                          controller.onPasswordChanged(value ?? ''),
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                      validator: FormBuilderValidators.required(),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 16.0),
                    FilledButton(
                      onPressed: () {
                        if (controller.formKeyRegister.currentState
                                ?.validate() ??
                            false) {
                          controller.register();
                        }
                      },
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
