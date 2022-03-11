import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvp_all/splash/splash_canva.dart';
import 'dart:ui' as ui;
// Importaciones clase Vistas
import '../pages/onBoarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    _toOnbording();
    _image("assets/image/splash.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: CustomPaint(
            painter: SplashCanvas(image),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  _toOnbording() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OnBoarding(),
      ),
    );
  }

  _image(String path) async {
    final data = await rootBundle.load(path);
    final bits = data.buffer.asUint8List();
    final image = await decodeImageFromList(bits);
    setState(() {
      this.image = image;
    });
  }
}


