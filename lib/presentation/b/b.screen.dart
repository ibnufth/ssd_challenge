import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../infrastructure/theme/ssd_theme.dart';
import '../a/controllers/a.controller.dart';
import 'controllers/b.controller.dart';
import 'widget/dialog_qr.dart';
import 'widget/qr_code.dart';

class BScreen extends GetView<BController> {
  const BScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data SoC",
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: Get.find<SSDTheme>().containerDecoration,
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Manufacturer", style: textTheme.titleMedium),
                            Text("Model", style: textTheme.titleMedium),
                            Text("SDK", style: textTheme.titleMedium),
                            Text("Version Code", style: textTheme.titleMedium),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ": ${controller.manufacture.value}",
                              style: textTheme.titleMedium,
                            ),
                            Text(
                              ": ${controller.model.value}",
                              style: textTheme.titleMedium,
                            ),
                            Text(
                              ": ${controller.sdk.value}",
                              style: textTheme.titleMedium,
                            ),
                            Text(
                              ": ${controller.versionCode.value}",
                              style: textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Update refresh rate data sensor Screen A",
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {
                        Get.find<AController>().decreasePeriod();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Center(
                          child: Text(
                              "${Get.find<AController>().refreshRate.value}")),
                    ),
                    const SizedBox(width: 16),
                    FilledButton(
                        onPressed: () {
                          Get.find<AController>().increasePeriod();
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Generate QR Code",
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.width * .8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: DataTable2(
                      headingRowColor: MaterialStatePropertyAll(
                          colorScheme.primaryContainer),
                      showBottomBorder: true,
                      columnSpacing: 0,
                      horizontalMargin: 8,
                      columns: [
                        DataColumn2(
                            label: const Text("Text"),
                            fixedWidth: MediaQuery.of(context).size.width * .2),
                        DataColumn2(
                            label: const Text("Date"),
                            fixedWidth: MediaQuery.of(context).size.width * .2),
                        DataColumn2(
                            label: const Text("Action"),
                            fixedWidth: MediaQuery.of(context).size.width * .4),
                      ],
                      rows: List<DataRow2>.generate(
                          controller.listQR.length,
                          (index) => DataRow2(cells: [
                                DataCell(Text(controller.listQR[index].text)),
                                DataCell(Text(DateFormat('d-M-yyyy', 'id')
                                    .format(controller.listQR[index].date))),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: QRCodeView(
                                                  message: controller
                                                      .listQR[index].text),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.qr_code_2)),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              child: FromQR(
                                                  qr: controller.listQR[index]),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          controller.deleteQR(
                                              controller.listQR[index]);
                                        },
                                        icon: const Icon(Icons.delete)),
                                  ],
                                )),
                              ])),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.25,
                //         child: const Align(
                //             alignment: Alignment.center, child: Text("Text"))),
                //     SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.25,
                //         child: const Align(
                //             alignment: Alignment.center, child: Text("Date"))),
                //     SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.45,
                //         child: const Align(
                //             alignment: Alignment.center,
                //             child: Text("Action"))),
                //   ],
                // ),
                // controller.listQR.isEmpty
                //     ? const Text("Belum ada data")
                //     : ListView.builder(
                //         padding: const EdgeInsets.symmetric(horizontal: 16),
                //         shrinkWrap: true,
                //         itemCount: controller.listQR.length,
                //         itemBuilder: (context, index) {
                //           return QRItem(qr: controller.listQR[index]);
                //         },
                //       ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const Dialog(
                    child: FromQR(),
                  ));
        },
      ),
    );
  }
}
