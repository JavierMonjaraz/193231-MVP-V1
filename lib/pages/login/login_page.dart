import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                          const TextFormFieldCustom(
                            label: 'Correo Electrónico',
                            hintText: 'Email Address',
                            helpTextEnabled: false,
                          ),
                          SizedBox(height: size.height * 0.03),
                          const TextFormFieldPasswordScreen(
                            helpTextEnabled: false,
                            showHelpPassword: true,
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
                  child: CustomButtonApp(size: size, textButton: 'Ingresar'),
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

class TextFormFieldCustom extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? iconData;
  final bool helpTextEnabled;

  const TextFormFieldCustom(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.helpTextEnabled,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String labelHelpText =
        'Ingrese su correo eléctronico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña.';

    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: ColorsViews.bar_disabled),
      borderRadius: BorderRadius.circular(15),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
              suffixIcon: iconData != null ? Icon(iconData) : null,
              hintText: hintText,
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              helperText: helpTextEnabled ? labelHelpText : null,
              helperMaxLines: 4,
              helperStyle: const TextStyle(
                overflow: TextOverflow.ellipsis,
              )),
        )
      ],
    );
  }
}

class TextFormFieldPasswordScreen extends StatefulWidget {
  final bool helpTextEnabled;
  final bool showHelpPassword;

  const TextFormFieldPasswordScreen(
      {Key? key, required this.helpTextEnabled, required this.showHelpPassword})
      : super(key: key);

  @override
  State<TextFormFieldPasswordScreen> createState() =>
      _TextFormFieldPasswordScreenState();
}

class _TextFormFieldPasswordScreenState
    extends State<TextFormFieldPasswordScreen> {
  late bool _passwordVisible;
  final TextEditingController _userPasswordController = TextEditingController();

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Contraseña',
          textAlign: TextAlign.end,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: _userPasswordController,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                  color: _passwordVisible ? Colors.blue : ColorsViews.text_body,
                ),
                onPressed: () {
                  _passwordVisible = !_passwordVisible;
                  setState(() {});
                },
              ),
              hintText: 'Password',
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              helperText: widget.helpTextEnabled
                  ? 'La contraseña debe contener caracteres, números y simbolos con un minimo de 6 caracteres.'
                  : null,
              helperMaxLines: 2,
              helperStyle: const TextStyle(
                overflow: TextOverflow.ellipsis,
              )),
        ),
        if (widget.showHelpPassword)
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.25),
            child: TextButton(
              child: const Text(
                '¿Has olvidado tu contraseña?',
                style: TextStyle(
                    color: ColorsViews.bar_enabled,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.pushNamed(context, 'recover_password'),
            ),
          )
      ],
    );
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
