import 'package:flutter/material.dart';

class CardsView extends StatelessWidget {
  const CardsView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
      // color: Colors.greenAccent,
      child: Row(
        children: [
          _Card(
            size: size,
            urlImg:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCHOpilTctDwj54j3F3931DEE2dxLRPGEZRA&usqp=CAU",
            info: "",
          ),
          _Card(
            size: size,
            urlImg:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDRhikoNRJeAjILZ7rx_jm10A5dwGX-kO7Vw&usqp=CAU",
            info: "",
          ),

        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.size,
    required this.urlImg,
    required this.info,
  }) : super(key: key);

  final Size size;
  final String urlImg;
  final String info;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                children: [
                  Container(
                    height: 300,
                    // padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.center,
                        image: NetworkImage(
                          urlImg,
                        ),
                      ),
                    ),
                  )
                ],
              );
            });
      } ,
      child: Container(
        width: size.width * 0.5,
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 200,
                  // padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.center,
                      image: NetworkImage(
                        urlImg,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                info,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
