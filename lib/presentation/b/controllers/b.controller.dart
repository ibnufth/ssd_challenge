import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:synapsis_challenge/core/util/use_case.dart';
import 'package:synapsis_challenge/domain/qr/entity/qr.dart';
import 'package:synapsis_challenge/domain/qr/use_case/delete_qr.dart';
import 'package:synapsis_challenge/presentation/widget/snackbar.dart';

import '../../../domain/qr/use_case/add_qr.dart';
import '../../../domain/qr/use_case/get_list_qr.dart';
import '../../../domain/qr/use_case/update_qr.dart';

class BController extends GetxController {
  final GetQRListUseCase _getListQRUseCase;
  final AddQRUseCase _addQRUseCase;
  final UpdateQRUseCase _updateQRUseCase;
  final DeleteQRUseCase _deleteQRUseCase;

  RxString manufacture = "".obs;
  RxString model = "".obs;
  RxString sdk = "".obs;
  RxString versionCode = "".obs;

  RxString qrText = "".obs;
  Rx<DateTime> qrDate = DateTime.now().obs;

  RxList<QR> listQR = RxList(<QR>[]);
  RxBool loadingListQR = RxBool(false);
  RxBool loadingAddQR = RxBool(false);

  final formKey = GlobalKey<FormBuilderState>();

  BController()
      : _getListQRUseCase = Get.find(),
        _addQRUseCase = Get.find(),
        _updateQRUseCase = Get.find(),
        _deleteQRUseCase = Get.find();

  @override
  void onInit() {
    _determineDeviceInfo();
    _getListQR();
    super.onInit();
  }

  void _determineDeviceInfo() async {
    DeviceInfoPlugin infoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await infoPlugin.androidInfo;
    manufacture.value = androidDeviceInfo.manufacturer;
    model.value = androidDeviceInfo.model;
    sdk.value = androidDeviceInfo.version.sdkInt.toString();
    versionCode.value = androidDeviceInfo.version.codename;
  }

  void _getListQR() async {
    loadingListQR.value = true;
    final res = await _getListQRUseCase(NoParams());
    loadingListQR.value = false;
    res.fold((l) {
      showWarningSnackbar(l.message);
    }, (r) {
      listQR.value = r;
    });
    
  }

  void onTextChanged(String value) => qrText.value = value;
  void onDateChanged(DateTime value) => qrDate.value = value;

  void addQR() async {
    loadingAddQR.value = true;
    final res = await _addQRUseCase(QR(text: qrText.value, date: qrDate.value));
    loadingAddQR.value = false;
    res.fold(
      (l) => showWarningSnackbar(l.message),
      (r) => _getListQR(),
    );
  }

  void updateQR(int id) async {
    loadingAddQR.value = true;
    final res = await _updateQRUseCase(
        QR(id: id, text: qrText.value, date: qrDate.value));
    loadingAddQR.value = false;
    res.fold(
      (l) => showWarningSnackbar(l.message),
      (r) => _getListQR(),
    );
  }

  void deleteQR(QR qr) async {
    loadingAddQR.value = true;
    final res = await _deleteQRUseCase(qr);
    loadingAddQR.value = false;
    res.fold(
      (l) => showWarningSnackbar(l.message),
      (r) => _getListQR(),
    );
  }
}
