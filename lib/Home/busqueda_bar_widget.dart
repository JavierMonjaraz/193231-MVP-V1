import 'package:flutter/material.dart';

class BarBusquedaWidget extends StatelessWidget {
  const BarBusquedaWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 35,
          width: size.width * 0.85,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: Expanded(
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.only(
                      left: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    filled: true,
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintText: "Buscar productos o servicios...",
                    fillColor: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.settings),
        ),
      ],
    );
  }
}
