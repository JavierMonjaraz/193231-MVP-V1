import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar Contraseña"),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                  flex: 2,
                  child: Center(
                      child: Text(
                    'Ingresa tu email para reestablecer tu contraseña',
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
                      children: const [
                        TextFormFieldCustom(
                          label: 'Correo Electrónico',
                          hintText: 'Dirección de correo',
                          helpTextEnabled: true,
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
                child:
                    CustomButtonApp(size: size, textButton: 'Enviar Solicitud'),
              ),
              const Expanded(flex: 1, child: SizedBox())
            ],
          ),
        ),
      ),
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
