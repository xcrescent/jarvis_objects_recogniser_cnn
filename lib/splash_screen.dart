import 'package:flutter/material.dart';
import 'package:jarvis_objects_recogniser_cnn/home_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 12),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/2.2 back.jpg',
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Jarvis Object Detector App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      );
      // seconds: 12,
      // navigateAfterSeconds: const HomePage(),
      // imageBackground: Image.asset('assets/images/back.jpg').image,
      // useLoader: false,
      // loaderColor: Colors.pink,
      // loadingText: const Text(
      //   'Loading....',
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 20,
      //   ),
      // ),
    
  }
}
