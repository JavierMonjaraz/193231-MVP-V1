import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

class OpcionesProductosWidget extends StatefulWidget {
  const OpcionesProductosWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<OpcionesProductosWidget> createState() =>
      _OpcionesProductosWidgetState();
}

class _OpcionesProductosWidgetState extends State<OpcionesProductosWidget> {
  int opcion = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: widget.size.height * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.size.width * 0.40,
              height: widget.size.height * 0.28,
              child: GestureDetector(
                onTap: (() {
                  setState(() {
                    opcion = 1;
                  });
                }),
                child: Card(
                  elevation: 10,
                  shadowColor:
                      (opcion == 1) ? ColorsViews.text_header : ColorsViews.background,
                  child: Column(
                    children: [
                      Image.asset("assets/onBoarding/B5.png"),
                      const SizedBox(height: 30,),
                      Text(
                        "Productos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: widget.size.width * 0.05,
                          color: ColorsViews.btn_vendedor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widget.size.width * 0.40,
              height: widget.size.height * 0.28,
              child: GestureDetector(
                onTap: (() {
                  setState(() {
                    opcion = 2;
                  });
                }),
                child: Card(
                  elevation: 10,
                  shadowColor:
                      (opcion == 2) ? ColorsViews.text_header : ColorsViews.background,
                  child: Column(
                    children: [
                      Image.asset("assets/onBoarding/B1.png"),
                      Padding(
                        padding:
                            EdgeInsets.only(top: widget.size.height * 0.02),
                        child: Text(
                          "Servicios",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.size.width * 0.05,
                            color: ColorsViews.btn_vendedor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
