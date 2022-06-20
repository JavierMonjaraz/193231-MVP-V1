import 'package:flutter/material.dart';

class MascotasWidget extends StatefulWidget {
  const MascotasWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<MascotasWidget> createState() => _MascotasWidgetState();
}

class _MascotasWidgetState extends State<MascotasWidget> {
  int cantidad = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titulo(),
            addmascotas(),
          ],
        ),
      ),
    );
  }

  Text titulo() {
    return Text(
      "Mis mascotas",
      style: TextStyle(
        fontSize: widget.size.width * 0.05,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Padding addmascotas() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cantidad,
          itemBuilder: (BuildContext context, int index) {
            if (cantidad - 1 == index) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: Icon(
                            Icons.add_circle_rounded,
                            size: widget.size.height * 0.08,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              cantidad++;
                            });
                          },
                        ),
                      ),
                      Column(
                        children: const [
                          Text("Agregar"),
                          Text("mascotas"),
                        ],
                      )
                    ],
                  ),
                ],
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK5dSkKSwXQgJ6Gtltu5F4yGp0-QnhzA66ig&usqp=CAU'),
                    ),
                  ),
                ),
                const Text("Mi perro")
              ],
            );
          },
        ),
      ),
    );
  }
}
