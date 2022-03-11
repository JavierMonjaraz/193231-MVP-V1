import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 0.0),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
                height: 48,
                width: 300,
                decoration: const BoxDecoration(
                    color: Color(0xFF3169f5),
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 85,
                      ),
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Continuar con Google",
                        style: TextStyle(color: Colors.white),
                      )
                    ])),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 48,
                width: 300,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color(0xFF324fa5),
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 85,
                      ),
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Continuar con Facebook",
                        style: TextStyle(color: Colors.white),
                      )
                    ])),
            const SizedBox(
              height: 45,
            ),
            Container(
                height: 48,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF646864)),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(40.0))),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 85,
                      ),
                      Icon(Icons.mail, color: Color(0xFF646864)),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Registrarse con  e-mail",
                        style: TextStyle(color: Color(0xFF646864)),
                      )
                    ])),
            const SizedBox(
              height: 68,
            ),
            Column(
              children: [
                SizedBox(
                    height: 30,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Entrar como invitado",
                          style: TextStyle(color: Color(0xFFfc1460))),
                    )),
                SizedBox(
                    height: 30,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Entrar como vendedor",
                          style: TextStyle(color: Color(0xff76aa757))),
                    )),
              ],
            ),
            const SizedBox(
              height: 65,
            ),
            Container(
              alignment: Alignment.center,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("¿Ya tienes cuenta?"),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Iniciar Sesión",
                      style: TextStyle(color: Color(0xFFfc1460)),
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
