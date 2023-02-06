// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/display_picture.controller.dart';

class DisplayPictureScreen extends GetView<DisplayPictureController> {
  final String imagePath;
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DisplayPictureScreen'),
          centerTitle: true,
        ),
        body: Image.file(File(imagePath)));
  }
}
