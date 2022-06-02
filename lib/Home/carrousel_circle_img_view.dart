import 'package:flutter/material.dart';

class CarrouselCircleImg extends StatelessWidget {
  CarrouselCircleImg({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  final List images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK5dSkKSwXQgJ6Gtltu5F4yGp0-QnhzA66ig&usqp=CAU",
    "https://media.traveler.es/photos/613760adcb06ad0f20e11980/master/w_1600%2Cc_limit/202931.jpg",
    "https://www.lavanguardia.com/files/image_449_220/uploads/2022/04/14/62582316cdc6c.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.15,
      // color: Colors.blueGrey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  images[index],
                ),
                child: Center(
                  child: Text(""),
                ),
                radius: 50,
              ),
            );
          }),
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
