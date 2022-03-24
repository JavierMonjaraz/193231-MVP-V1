import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Map<String, String>> boardingData = [
    {
      'image': "assets/onBoarding/B1.png",
      'titulo': 'ESPARCIMIENTO',
      'text': "Brindamos todos los servicios para consentir a tu mascota.",
    },
    {
      'image': "assets/onBoarding/B2.png",
      'titulo': 'ADOPCIÓN',
      'text':
          "Nulla Faucibus tellus ut odio scelerisque, viate molestie lectus feugiat.",
    },
    {
      'image': "assets/onBoarding/B3.png",
      'titulo': 'HOSPITALIDAD',
      'text':
          "Nulla Faucibus tellus ut odio scelerisque, viate molestie lectus feugiat.",
    },
    {
      'image': "assets/onBoarding/B4.png",
      'titulo': 'VETERINARIA',
      'text':
          "Nulla Faucibus tellus ut odio scelerisque, viate molestie lectus feugiat.",
    },
    {
      'image': "assets/onBoarding/B5.png",
      'titulo': 'TIENDA',
      'text':
          "Compra todas las necesidades de tu mascota sin salir de tu casa.",
    },
  ];

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorsViews.background,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        page = value;
                      });
                    },
                    itemCount: boardingData.length,
                    itemBuilder: (context, index) => ContainerBoarding(
                      image: boardingData[index]['image']!,
                      tittle: boardingData[index]['titulo']!,
                      text: boardingData[index]['text']!,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(boardingData.length,
                              (index) => _animatedContainer(index: index)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 120),
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (page == boardingData.length - 1) {
                                  Navigator.pushReplacementNamed(context, 'home');
                                }
                              },
                              child: Text(
                                page == boardingData.length - 1
                                    ? 'Continuar'
                                    : 'Siguiente',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                        color: page == boardingData.length - 1
                                            ? Colors.transparent
                                            : ColorsViews.text_body,
                                      )),
                                  elevation: 1,
                                  primary: page == boardingData.length - 1
                                      ? ColorsViews.btn_continuar
                                      : ColorsViews.background,
                                  onPrimary: page == boardingData.length - 1
                                      ? ColorsViews.background
                                      : ColorsViews.text_body),
                            ),
                          ),
                        )
                      ],
                    ),
                    // color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: page == index ? 20 : 12,
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: page == index
              ? ColorsViews.bar_enabled
              : ColorsViews.bar_disabled),
    );
  }
}

class ContainerBoarding extends StatelessWidget {
  final String image;
  final String tittle;
  final String text;

  const ContainerBoarding(
      {Key? key, required this.image, required this.text, required this.tittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 200,
              width: 200,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  tittle,
                  style: TextStyle(
                      color: ColorsViews.text_header,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsViews.text_body,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }
}
