import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jarvis_objects_recogniser_cnn/main.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCameraReady = false;
  String result = "";
  late CameraController cameraController;
  CameraImage? imgCamera;
  dynamic _interpreter;

  loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/models/6.1 mobilenet_v1_1.0_224.tflite');
    // await Tflite.loadModel(
    //   model: "assets/model_unquant.tflite",
    //   labels: "assets/labels.txt",
    // );
  }

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((image) {
          if (!isCameraReady) {
            isCameraReady = true;
            imgCamera = image;
            runModelOnStreamFrames();
          }
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // initCamera();
  }

  void runModelOnStreamFrames() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/2.1 jarvis.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 320,
                      width: 330,
                      child: Image.asset(
                        'assets/images/2.3 camera.jpg',
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        initCamera();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 35),
                        height: 270,
                        width: 360,
                        child: imgCamera == null
                            ? Container(
                                height: 270,
                                width: 360,
                                child: Icon(
                                  Icons.photo_camera_front,
                                  color: Colors.blueAccent,
                                  size: 40,
                                ),
                              )
                            : AspectRatio(
                                aspectRatio: cameraController.value.aspectRatio,
                                child: CameraPreview(cameraController),
                              ),
                      ),
                    ),
                  ),
                ],
              )
              //     Expanded(
              //       child: Container(
              //         child: Center(
              //           child: AspectRatio(
              //             aspectRatio: cameraController.value.aspectRatio,
              //             child: CameraPreview(cameraController),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       height: 100,
              //       child: Center(
              //         child: Text(
              //           result,
              //           style: const TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //           ),
              //         ),
              //       ),
              //     ),
            ],
          ),
        ),
      ),
    );
  }
}
