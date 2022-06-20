import 'package:flutter/material.dart';

import '../Conection/service_images.dart';

class CarrouselImagePrincipal extends StatefulWidget {
  const CarrouselImagePrincipal({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CarrouselImagePrincipal> createState() =>
      _CarrouselImagePrincipalState();
}

class _CarrouselImagePrincipalState extends State<CarrouselImagePrincipal> {
  int count = 0;
  int actual = 0;
  List<String> listaImagenes = [];

  final PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    getImages();
    controller.addListener(() {
      if (controller.page!.round() != actual) {
        setState(() {
          actual = controller.page!.round();
        });
      }
    });
  }

  void getImages() async {
    var imagenes = await GetImagesCarousel();
    setState(() {
      listaImagenes = imagenes;
      count = imagenes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.2,
      width: widget.size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: widget.size.height * 0.2,
            width: widget.size.width,
            child: PageView.builder(
              controller: controller,
              itemCount: count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.center,
                          image: NetworkImage(
                            listaImagenes[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
