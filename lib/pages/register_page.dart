import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';
import 'package:http/http.dart';

class RegistrerPage extends StatefulWidget {
  const RegistrerPage({Key? key}) : super(key: key);

  @override
  State<RegistrerPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegistrerPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final nombre = TextEditingController();
  bool _passwordVisible = false;
  bool politicasIsChecked = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: ColorsViews.bar_disabled),
      borderRadius: BorderRadius.circular(15),
    );

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return ColorsViews.text_body;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Regístrate"),
        elevation: 0,
        backgroundColor: ColorsViews.text_header,
        foregroundColor: ColorsViews.bar_enabled,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Expanded(
                flex: 2,
                child: Center(
                    child: Text(
                  'Crea una cuenta para empezar a usar la app',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorsViews.text_body,
                  ),
                ))),
            Expanded(
              flex: 6,
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nombre",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: nombre,
                            decoration: InputDecoration(
                                hintText: "Nombre Completo",
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Correo Electrónico",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                                hintText: "Dirección de correo",
                                focusedBorder: outlineInputBorder,
                                enabledBorder: outlineInputBorder),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Contraseña",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: password,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              hintText: "Password",
                              focusedBorder: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.visibility,
                                  color: _passwordVisible
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  _passwordVisible = !_passwordVisible;
                                  setState(() {});
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    checkColor: Colors.transparent,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: politicasIsChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        politicasIsChecked = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Al registrarme, acepto los ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                              text: 'términos y condiciones ',
                              style: const TextStyle(
                                  color: ColorsViews.bar_enabled),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('termino y condiciones')),
                          const TextSpan(
                            text: 'y la ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'política de privacidad',
                            style:
                                const TextStyle(color: ColorsViews.bar_enabled),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print('politica de privacidad'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.5,
                child: ElevatedButton(
                  child: const Text(
                    "Crear Cuenta",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: ColorsViews.btn_continuar,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () async {
                    if(politicasIsChecked){
                      if(!(nombre.text == '') && !(email.text =='') && !(password.text =='')){
                        Response response = await post(
                            Uri.parse('http://192.168.1.65:3000/api/v1/register'),
                            body: {
                              'name': nombre.text,
                              'email': email.text,
                              'password': password.text
                            });
                        if(response.statusCode == 200) {
                          nombre.clear();
                          email.clear();
                          password.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                              Text('Registrado correctamente'),
                            ),
                          );
                          Navigator.pushNamed(context, 'login');
                        }
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text('No ha llenado todos los campos'),
                          ),
                        );
                      }
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                          Text('Debe aceptar los terminos y condiciones'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: buttonLogin(
                text: '¿Ya tienes una cuenta? ',
                textButton: 'Iniciar sesión',
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class buttonLogin extends StatelessWidget {
  final String text;
  final String textButton;

  const buttonLogin({
    Key? key,
    required this.text,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Text(text),
          InkWell(
            child: Text(
              textButton,
              style: const TextStyle(
                  color: ColorsViews.bar_enabled, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              if (textButton == 'Iniciar sesión') {
                Navigator.pushNamed(context, 'login');
              } else if (textButton == 'Regístrate') {
                Navigator.pushNamed(context, 'register');
              } else {}
            },
          ),
        ],
      ),
    );
  }
}
