import 'package:flutter/material.dart';
import 'package:mvp_all/pages/login/login.dart';
import 'package:mvp_all/pages/progress/progress_canva.dart';
import 'package:mvp_all/pages/progress/progress_view.dart';
import 'package:mvp_all/splash/splas_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'splash',
      routes: {
        'splash': (BuildContext context) => const SplashView(),
        'login': (BuildContext context) => const LoginApp(),
        'progress_custom': (BuildContext context) => const ProgressView(),
      },
    );
  }
}
