// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_challenge/presentation/display_picture/display_picture.screen.dart';

import 'controllers/camera.controller.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription cameraDescription;
  const CameraScreen({
    Key? key,
    required this.cameraDescription,
  }) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  int indexFlash = 0;
  List<IconData> icons = [
    Icons.flash_off,
    Icons.flash_auto,
    Icons.flash_on,
    Icons.flashlight_on,
  ];

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  void initCamera() async {
    cameraController =
        CameraController(widget.cameraDescription, ResolutionPreset.max);
    initializeControllerFuture = cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CameraScreen'),
        centerTitle: true,
      ),
      body: GetBuilder<CameraViewController>(
        init: CameraViewController(),
        initState: (_) {},
        builder: (controller) {
          return FutureBuilder(
              future: initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(
                    cameraController,
                    child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () async {
                                  setState(() {
                                    if (indexFlash <
                                        FlashMode.values.length - 1) {
                                      indexFlash++;
                                    } else {
                                      indexFlash = 0;
                                    }
                                  });
                                  await cameraController.setFlashMode(
                                      FlashMode.values[indexFlash]);
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(icons[indexFlash], size: 30),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await initializeControllerFuture;
                                await cameraController
                                    .setFlashMode(FlashMode.values[indexFlash]);
                                final image =
                                    await cameraController.takePicture();
                                    
                                if (!mounted) return;
                                Get.to(DisplayPictureScreen(
                                    imagePath: image.path));
                              },
                              icon: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(Icons.camera_alt, size: 30),
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        )),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              });
        },
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
