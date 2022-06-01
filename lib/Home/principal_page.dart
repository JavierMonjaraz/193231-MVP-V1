import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cards_view.dart';
import 'carrousel_circle_img_view.dart';
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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    HomePage2(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage();
}

class _HomePage extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CarrouselImage(size: size),
          CarrouselCircleImg(size: size),
          CardsView(size: size),
          CardsView(size: size),
        ],
      ),
    ));
  }
}
