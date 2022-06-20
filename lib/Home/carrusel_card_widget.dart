import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

import '../Conection/service_images.dart';

class CarrouselImageCard extends StatefulWidget {
  const CarrouselImageCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CarrouselImageCard> createState() => _CarrouselImageCardState();
}

class _CarrouselImageCardState extends State<CarrouselImageCard> {
  int count = 0;
  int actual = 0;
  List<dynamic> listaImagenes = [];

  final PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    getImages();
  }

  void getImages() async {
    // print("imagenes carrusel");
    var imagenes = await GetImagesCards();
    setState(() {
      listaImagenes = imagenes;
      count = imagenes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: widget.size.width,
      height: widget.size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            generateFirstRow(),
          ],
        ),
      ),
    );
  }

  Padding generateFirstRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 10),
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height * 0.4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: widget.size.height * 0.35,
                    width: widget.size.width * 0.45,
                    child: Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: widget.size.height * 0.2,
                              child: Image.network(
                                  listaImagenes[index]["urlImage"]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              listaImagenes[index]["name"],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: widget.size.width * 0.04,
                                color: ColorsViews.background,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              listaImagenes[index]["description"],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: widget.size.width * 0.03,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$" +
                                      listaImagenes[index]["price"].toString(),
                                  style: TextStyle(
                                    fontSize: widget.size.width * 0.04,
                                  ),
                                ),
                                Text(
                                  "10 % Desc.",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: widget.size.width * 0.04,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
