import 'package:flutter/material.dart';
import 'package:mvp_all/Home/bar_products_widget.dart';
import 'package:mvp_all/Home/bar_services_widget.dart';
import 'package:mvp_all/Home/busqueda_bar_widget.dart';
import 'package:mvp_all/Home/carrusel_card_widget.dart';
import 'package:mvp_all/Home/carrusel_widget.dart';
import 'package:mvp_all/Home/mascotas_widget.dart';
import 'package:mvp_all/Home/opciones_servicios_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/colors/colors_views.dart';
import 'carrousel_img_view.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _selectedIndex = 1;
  String name = "";
  final List<bool> _isOpen = [false, false];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   HomePage2(),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          title: Text("Tienda"),
          elevation: 0,
          actions: true ? [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => {print('ICONS - SHOPPING')},
                        child: const Icon(Icons.shopping_bag_outlined, color: ColorsViews.background)
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                        onTap: () => {print('ICONS - NOTIFICACION')},
                        child: const Icon(Icons.notifications, color: ColorsViews.background)
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                        onTap: () => {print('ICONS - MANAGE ACCOUNTS')},
                        child: const Icon(Icons.manage_accounts_outlined, color: ColorsViews.background)
                    )
                  ]),
            )
          ]:
          null,
          backgroundColor: ColorsViews.text_header,
          foregroundColor: ColorsViews.bar_enabled,
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        body: HomePage2(name: name,),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    const CircleAvatar(
                      child: Text("Imagen"),
                      radius: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(name),
                  ],
                ),
              ),
              ExpansionPanelList(
                expansionCallback: ((panelIndex, isExpanded) {
                  setState(() {
                    _isOpen[panelIndex] = !isExpanded;
                  });
                }),
                elevation: 0,
                expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  ExpansionPanel(
                    isExpanded: _isOpen[0],
                    headerBuilder: (context, value) {
                      return Container(
                        child: const Center(
                          child: Text("Menu 1"),
                        ),
                      );
                    },
                    body: Container(
                      child: const Text("Opciones"),
                    ),
                  ),
                  ExpansionPanel(
                    isExpanded: _isOpen[1],
                    headerBuilder: (context, value) {
                      return Container(
                        child: const Center(
                          child: Text("Menu 1"),
                        ),
                      );
                    },
                    body: Container(
                      child: const Text("Opciones"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          width: size.width,
          child: Stack(
              children: [
                CustomPaint(
                  painter: BottomCanvas(),
                  size: Size(size.width, size.width *0.5),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const TabBar(
                      indicatorColor: Colors.transparent,
                      labelColor: ColorsViews.btn_invitado,
                      tabs: [
                        Tab(icon: Icon(Icons.home_rounded, color: ColorsViews.background,)),
                        Tab(icon: Icon(Icons.assignment_outlined, color: ColorsViews.background,),),
                        Tab(icon: Icon(Icons.pets_outlined, color: ColorsViews.background,),),
                      ]
                  ),
                )
              ]
          ),
        )
    ));

  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<HomePage2> createState() => _HomePage();
}

class _HomePage extends State<HomePage2> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child:SingleChildScrollView(
      child: Column(
        children: [
          DescriptionWidget(size: size, name: widget.name,),
          const Divider(thickness: 2),
          MascotasWidget(size: size),
          OpcionesProductosWidget(size: size),
          BarBusquedaWidget(size: size),
          CarrouselImage(size: size),
          // CarrouselImagePrincipal(size: size),
          const Divider(thickness: 2),
          ProductosSecaWidget(size: size),
          CarrouselImageCard(size: size),
          const Divider(thickness: 2),
          ServiceSecaWidget(size: size),
          CarrouselImageCard(size: size)
          // CarrouselCircleImg(size: size),
          // CardsView(size: size),
          // CardsView(size: size),
        ],
      ),
    )));
  }
}


class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.size,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.24,
      child: Row(
        children: [
          InfomationWidget(size: size, name: name,),
          SizedBox(
            width: size.width * 0.5,
            height: size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: size.height * 0.11,
                    width: size.width * 0.4,
                    child: Image.asset("assets/onBoarding/B5.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    left: size.height * 0.01,
                    right: size.height * 0.01,
                  ),
                  child: const ExpansionTile(
                    textColor: Colors.black,
                    collapsedBackgroundColor:
                    Color.fromARGB(255, 231, 231, 231),
                    title: Text(
                      'Entrega domicilio',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    children: <Widget>[],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfomationWidget extends StatelessWidget {
  const InfomationWidget({
    Key? key,
    required this.size,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String name;


  @override
  Widget build(BuildContext context) {
    final split = name.split(' ');
    return SizedBox(
      width: size.width * 0.5,
      height: size.height,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.018,
                  bottom: size.height * 0.02,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(
                          text: 'Hola ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                        TextSpan(
                          text: split[0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade400,
                            fontSize: 30,
                          ),
                        ),
                        const TextSpan(
                          text: ',',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            // color: Colors.blue,
            height: size.height * 0.13,
            child: Row(
              children: [
                Container(
                  // color: Colors.red,
                  width: size.width * 0.1,
                  height: size.height * 0.1,
                  child: Image.asset("assets/onBoarding/B5.png"),
                ),
                Container(
                  // color: Colors.amber,
                  width: size.width * 0.4,
                  height: size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Entregar ahora",
                        style: TextStyle(color: Colors.grey),
                      ),
                      ExpansionTile(
                        title: Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "Calle 10 9",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCanvas extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint();
    paint0.color = ColorsViews.splashbg;
    paint0.style = PaintingStyle.fill;
    paint0.strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.0980000);
    path0.quadraticBezierTo(size.width*0.0483500,size.height*0.0005000,size.width*0.1996000,0);
    path0.cubicTo(size.width*0.3509000,size.height*-0.0038000,size.width*0.4223000,size.height*0.2590000,size.width*0.5008000,size.height*0.2664000);
    path0.cubicTo(size.width*0.5862000,size.height*0.2692000,size.width*0.6562000,size.height*-0.0116000,size.width*0.8016000,0);
    path0.quadraticBezierTo(size.width*0.9522000,size.height*-0.0142000,size.width,size.height*0.0368000);
    path0.lineTo(size.width,size.height);

    canvas.drawPath(path0, paint0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}