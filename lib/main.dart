import 'package:flutter/material.dart';
import 'package:mvp_all/pages/login/home_page.dart';
import 'package:mvp_all/pages/login/login_page.dart';
import 'package:mvp_all/pages/progress/progress_canva.dart';
import 'package:mvp_all/pages/progress/progress_view.dart';
import 'package:mvp_all/pages/recover_password.dart';
import 'package:mvp_all/pages/register_page.dart';
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
        'home': (BuildContext context) => const HomePage(),
        'login': (BuildContext context) => const LoginPage(),
        'registro': (BuildContext context) => const RegistrerPage(),
        'recover_password': (BuildContext context) => const RecoverPassword(),
        'progress_custom': (BuildContext context) => const ProgressView(),
      },
    );
  }
}
