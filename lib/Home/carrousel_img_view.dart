import 'dart:async';

import 'package:flutter/material.dart';
import '../styles/colors/colors_views.dart';

class CarrouselImage extends StatefulWidget {
  const CarrouselImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CarrouselImage> createState() => _CarrouselImageState();
}

class _CarrouselImageState extends State<CarrouselImage> {
  final int count = 10;
  int actual = 0;

  List images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-r9s0PrT19H4yk3gq4TROI7YZasCJSGhz2Q&usqp=CAU",
    "https://housepet.es/blog/wp-content/uploads/2021/07/consulsiones-en-perros.jpg",
    "https://estaticos-cdn.prensaiberica.es/clip/76091432-8b3a-482b-8209-cb4c51e54b0c_16-9-discover-aspect-ratio_default_0.jpg",
    "https://s1.eestatic.com/2021/06/24/curiosidades/mascotas/591454065_193121170_1706x960.jpg"

  ];

  final PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    controller.addListener(() {
      if (controller.page!.round() != actual) {
        setState(() {
          actual = controller.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _changeImage(images.length);
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height * 0.4,
      // color: Colors.red,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 15,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.center,
                        image: NetworkImage(
                          images[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return AnimatedContainer(
                  duration: kThemeAnimationDuration,
                  height: 7,
                  width: actual == index ? 20 : 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: ColorsViews.activeSliderColor,
                    color: actual == index
                        ? ColorsViews.bar_enabled
                        : ColorsViews.bar_disabled,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  void _changeImage(int imagesLenght) {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (actual == imagesLenght - 1) {
        controller.jumpToPage(controller.initialPage);
        timer.cancel();
      } else {
        controller.nextPage(
            duration: const Duration(seconds: 2), curve: Curves.easeIn);
        timer.cancel();
      }
    });
  }
}
