import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/pages/progress/progress_canva.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({Key? key}) : super(key: key);

  @override
  State<ProgressView> createState() => _ProgressView();
}

class _ProgressView extends State<ProgressView> {

  int carga = 0;
  late final Timer timer;
  @override
  void initState(){
    timer = Timer.periodic(Duration(milliseconds: 50),(_){
      if(carga<=100){
        carga++;
        setState(() {

        });
      }else{
        carga=0;
      }
    });
  }

  @override
  void Dipose(){
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          child: CustomPaint(
            painter: ProgressCustom(valor: carga),
          ),
        ),
      ),
    );
  }
}
