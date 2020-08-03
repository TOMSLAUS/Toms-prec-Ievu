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
    spawnOpacity: 0,
    opacityChangeRate: 0.55,
    minOpacity: 0.1,
    maxOpacity: 0.8,
    spawnMinSpeed: 0,
    spawnMaxSpeed: 0,
    spawnMinRadius: 1.0,
    spawnMaxRadius: 3.0,
    particleCount: 100,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AnimatedBackground(
        behaviour:  TwinkleParticleBehaviour(
          minTimeTwinkle: 1.0,
          maxTimeTwinkle: 3.0,
          options: particleOptions,
        ),
        vsync: this,
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}

class TwinkleInfo {
  double twinkleTime;
  double opacityChangeRate;
  bool changed;

  TwinkleInfo({this.twinkleTime, this.opacityChangeRate, this.changed = false});
}

class TwinkleParticleBehaviour extends RandomParticleBehaviour {
  final double minTimeTwinkle;
  final double maxTimeTwinkle;

  TwinkleParticleBehaviour({
    @required this.minTimeTwinkle,
    @required this.maxTimeTwinkle,
    ParticleOptions options = const ParticleOptions(),
    Paint paint,
  }) : super(options: options, paint: paint);

  @override
  void init() {
    super.init();

    // Adding some initial data so it starts twinkling at the start
    for (Particle particle in particles) {
      final changed = RandomParticleBehaviour.random.nextBool();
      particle.data = TwinkleInfo(
        twinkleTime: RandomParticleBehaviour.random.nextDouble() * maxTimeTwinkle,
        opacityChangeRate: options.opacityChangeRate * (changed ? -1.0 : 1.0),
        changed: changed,
      );
    }
  }

  @override
  void initParticle(Particle p) {
    super.initParticle(p);

    // Add twinkling info for particle initialization
    final twinkleTime = minTimeTwinkle + RandomParticleBehaviour.random.nextDouble() * (maxTimeTwinkle - minTimeTwinkle);
    p.data = TwinkleInfo(
      twinkleTime: twinkleTime,
      opacityChangeRate: options.opacityChangeRate,
    );
  }

  @override
  void updateParticle(Particle particle, double delta, Duration elapsed) {
    final twinkleInfo = particle.data as TwinkleInfo;
    // Update twinkling time
    twinkleInfo.twinkleTime -= delta;
    if (twinkleInfo.twinkleTime < 0 && !twinkleInfo.changed) {
      // Flip the opacity rate when it comes to time
      twinkleInfo.changed = true;
      twinkleInfo.opacityChangeRate = -twinkleInfo.opacityChangeRate;
      particle.targetAlpha = options.spawnOpacity;
    }

    if (twinkleInfo.opacityChangeRate > 0 && particle.alpha < particle.targetAlpha ||
        twinkleInfo.opacityChangeRate < 0 && particle.alpha > particle.targetAlpha) {

      // Update the alpha with out opacity rate
      particle.alpha = particle.alpha + delta * twinkleInfo.opacityChangeRate;

      if (twinkleInfo.opacityChangeRate > 0 && particle.alpha > particle.targetAlpha ||
          twinkleInfo.opacityChangeRate < 0 && particle.alpha < particle.targetAlpha) {
        particle.alpha = particle.targetAlpha;
      }

      if (twinkleInfo.changed && (twinkleInfo.opacityChangeRate > 0 && particle.alpha >= particle.targetAlpha ||
          twinkleInfo.opacityChangeRate < 0 && particle.alpha <= particle.targetAlpha)) {
        // Re-initialize the particle if needed
        initParticle(particle);
      }
    }
  }
}


enum ParticleType {
  Shape,
  Image,
}