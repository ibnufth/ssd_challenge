import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:synapsis_challenge/core/enum/enum.dart';
import 'package:synapsis_challenge/presentation/a/a.screen.dart';
import 'package:synapsis_challenge/presentation/auth/controllers/auth_controller.dart';
import 'package:synapsis_challenge/presentation/screens.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() =>
            Text(PageMenu.values[controller.currentPageIndex.value].title)),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.find<AuthController>().logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
            onDestinationSelected: (index) {
              controller.changePage(index);
            },
            selectedIndex: controller.currentPageIndex.value,
            destinations: [
              ...PageMenu.values.map(
                (menu) => NavigationDestination(
                    icon: Text(menu.initial), label: menu.title),
              ),
            ],
          )),
      body: Obx(() => [
            const AScreen(),
            const BScreen(),
            CScreen(),
          ][controller.currentPageIndex.value]),
    );
  }
}
