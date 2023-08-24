import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jarvis_objects_recogniser_cnn/splash_screen.dart';




List<CameraDescription> cameras = [];

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jarvis Object Detector App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MySplashScreen(),
    );
  }
}
