import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginNfcView extends GetView<AuthController> {
  const LoginNfcView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginNfc'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isCheckingNFCAffability.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.isNFCAvailable.value) {
            return Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Icon(
                    Icons.radar,
                    size: 400,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.5),
                  ),
                  Text(
                    'Please Tap NFC',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Your device not support NFC, please check your settings if your phone has NFC support',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        }));
  }
}
