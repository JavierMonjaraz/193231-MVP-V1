import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          padding: EdgeInsets.fromLTRB(
              size.width * 0.07, size.height * 0.09, size.width * 0.07, 0.0),
          color: ColorsViews.background,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.blue),
                // ),
                child: Image.asset('assets/image/login.png'),
              ),
              SizedBox(
                height: (size.height * 0.08),
              ),
              elevatedButton(
                  context,
                  FontAwesomeIcons.google,
                  'Continuar con Google',
                  ColorsViews.btn_google,
                  ColorsViews.background,
                  Colors.transparent),
              SizedBox(
                height: size.height * 0.03,
              ),
              elevatedButton(
                  context,
                  Icons.facebook,
                  'Continuar con Facebook',
                  ColorsViews.btn_facebook,
                  ColorsViews.background,
                  Colors.transparent),
              SizedBox(
                height: size.height * 0.05,
              ),
              elevatedButton(
                  context,
                  Icons.email,
                  'Registrarse con e-mail',
                  ColorsViews.background,
                  ColorsViews.btn_email,
                  ColorsViews.btn_email),
              SizedBox(
                height: size.height * 0.07,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Entrar como invitado",
                        style: TextStyle(color: ColorsViews.btn_invitado),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Entrar como vendedor",
                        style: TextStyle(color: ColorsViews.btn_vendedor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("¿Ya tienes cuenta?"),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, 'login'),
                      child: const Text(
                        "Iniciar Sesión",
                        style: TextStyle(color: Color(0xFFfc1460)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton elevatedButton(BuildContext context, IconData icondata,
      String text, Color colorBackground, Color colorText, Color borderColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: borderColor)),
        primary: colorBackground,
      ),
      onPressed: () => {
        if (text == 'Registrarse con e-mail')
          {Navigator.pushNamed(context, 'registro')}
      },
      child: SizedBox(
        width: 300,
        height: 48,
        child: Row(
          children: [
            const SizedBox(width: 10),
            FaIcon(icondata, color: colorText),
            const SizedBox(width: 50),
            Text(text,
                style: TextStyle(
                    color: colorText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
