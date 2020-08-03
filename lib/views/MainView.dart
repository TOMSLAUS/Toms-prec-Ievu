import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class MainView extends StatefulWidget {
  static const id = "MainView";
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {


  ParticleType _particleType = ParticleType.Image;



  ParticleOptions particleOptions = ParticleOptions(
    baseColor: Colors.white,
    spawnOpacity: 1,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.5,
    spawnMinSpeed: 0.5,
    spawnMaxSpeed: 1,
    spawnMinRadius: 1.0,
    spawnMaxRadius: 3.0,
    particleCount: 150,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AnimatedBackground(
        behaviour:  RandomParticleBehaviour(
          options: particleOptions,
        ),
        vsync: this,
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}



enum ParticleType {
  Shape,
  Image,
}