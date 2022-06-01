import 'package:flutter/material.dart';

class CarrouselCircleImg extends StatelessWidget {
  const CarrouselCircleImg({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.15,
      // color: Colors.blueGrey,
      child: Container(
        // color: Colors.black,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK5dSkKSwXQgJ6Gtltu5F4yGp0-QnhzA66ig&usqp=CAU",
                ),
                child: Center(
                  child: Text("$index"),
                ),
                radius: 30,
              ),
            );
          }),
          itemCount: 20,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
