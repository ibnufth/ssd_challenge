import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:synapsis_challenge/presentation/b/controllers/b.controller.dart';

import '../../../domain/qr/entity/qr.dart';

class FromQR extends GetView<BController> {
  final QR? qr;
  const FromQR({
    super.key,
    this.qr,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return FormBuilder(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            qr == null
                ? Text(
                    "Add data",
                    style: textTheme.titleMedium,
                  )
                : Text(
                    "Edit Data",
                    style: textTheme.titleMedium,
                  ),
            FormBuilderTextField(
              name: "Text",
              initialValue: qr?.text,
              decoration: const InputDecoration(
                labelText: "Text",
              ),
              onChanged: (value) {
                if (value != null) controller.onTextChanged(value);
              },
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(height: 8),
            FormBuilderDateTimePicker(
              initialDatePickerMode: DatePickerMode.day,
              timePickerInitialEntryMode: TimePickerEntryMode.input,
              inputType: InputType.date,
              name: "Date Time",
              initialValue: qr?.date,
              decoration: const InputDecoration(
                labelText: "Date Time",
              ),
              onChanged: (value) {
                if (value != null) controller.onDateChanged(value);
              },
              validator: FormBuilderValidators.required(),
            ),
            FilledButton(
                onPressed: () {
                  if (controller.formKey.currentState?.saveAndValidate() ??
                      false) {
                    if (qr == null) {
                      controller.addQR();
                    } else {
                      controller.updateQR(qr!.id!);
                    }
                    Get.back();
                  }
                },
                child: Text(qr == null ? "Save" : "Update")),
          ],
        ),
      ),
    );
  }
}
