import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mvp_all/Conection/server.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{

  final email = TextEditingController();
  final password = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: ColorsViews.bar_disabled),
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Iniciar Sesión"),
          elevation: 0,
          backgroundColor: ColorsViews.text_header,
          foregroundColor: ColorsViews.bar_enabled,
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      'Inicia sesión con tu cuenta para continuar',
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
                        children: [
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
                                    hintText: "Email Address",
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
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: size.width * 0.9,
                    height: size.height * 0.5,
                    child: ElevatedButton(
                      child: const Text(
                        "Ingresar",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: ColorsViews.btn_continuar,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      onPressed: () async {
                        if(!(email.text == "") && !(password.text == "")){
                          Response response = await post(
                              Uri.parse(connect.url+'api/v1/login'),
                              body: {
                                'email': email.text,
                                'password': password.text
                              });
                          Map data = jsonDecode(response.body);
                          if(data['Token']==null){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                Text('Correo Electónico y/o Password incorrectos'),
                              ),
                            );
                          }else{
                            SharedPreferences.setMockInitialValues({});
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('token', data['Token']);
                            prefs.setString('name', data['Name']);
                            Navigator.pushNamedAndRemoveUntil(context, 'principal_page',(Route<dynamic> route) => false);
                          }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                              Text('No ha llenado todos los campos'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: BottomButtonCustom(
                    text: '¿Todavía no tienes una cuenta? ',
                    textButton: 'Regístrate',
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomButtonApp extends StatelessWidget {
  final Size size;
  final String textButton;

  const CustomButtonApp(
      {Key? key, required this.size, required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.5,
      child: ElevatedButton(
          child: Text(
            textButton,
            style: const TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              primary: ColorsViews.btn_continuar,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          onPressed: () => {}),
    );
  }
}

class BottomButtonCustom extends StatelessWidget {
  final String text;
  final String textButton;

  const BottomButtonCustom({
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
                Navigator.pushNamed(context, 'registro');
              } else {}
            },
          ),
        ],
      ),
    );
  }
}
