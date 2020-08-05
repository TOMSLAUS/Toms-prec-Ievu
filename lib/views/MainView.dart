import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';




class MainView extends StatefulWidget {
  static const id = "MainView";
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  double width, height;
  int _totalSteps = 8;
  int _currentStep = 1;
  ScrollController _scrollController;
  double previous = 0;
  double next = 0;
  double position = 0;
  bool hasBennBuilt = false;

  Animation _satelliteAnimation;
  AnimationController _satelliteController;

  _scrollListener() {
    position = _scrollController.position.pixels;
    //  if (_scrollController.position.pixels > next - (height / 5) ) {
    // previous = next;
    //  next = next + height;
    // _currentStep++;
    // }
  }

  void setCount(int count){
    _currentStep = count;
  }

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
    particleCount: 250,
  );

  @override
  void initState() {
    _satelliteController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _satelliteAnimation =
        CurvedAnimation(parent: _satelliteController, curve: Curves.linear);
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    Timer(Duration(seconds: 0), () {
      _satelliteController.forward();
    });
    _satelliteController.addListener(() {
      setState(() {});
    });
    _satelliteController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(seconds: 4), () {
          _satelliteController.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        Timer(Duration(seconds: 4), () {
          _satelliteController.forward();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if (!hasBennBuilt) {
      next = height;
    }
    hasBennBuilt = true;

    return Scrollbar(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            AnimatedBackground(
              behaviour: TwinkleParticleBehaviour(
                minTimeTwinkle: 1.0,
                maxTimeTwinkle: 3.0,
                options: particleOptions,
              ),
              vsync: this,
              child: Container(),
            ),
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                          top: height / 3,
                          left: -width / 12 +
                              (_satelliteAnimation.value *
                                  width *
                                  _satelliteAnimation.value *
                                  2),
                          child: Container(
                              height: height / 12,
                              width: height / 12,
                              child: Image.asset('/images/satellite.png'))),
                      VisibilityDetector(
                        key: Key('1'),
                        onVisibilityChanged: (visibilityInfo) {
                          int visiblePercentage =
                              (visibilityInfo.visibleFraction * 100).round();
                          if (visiblePercentage > 50) {
                            setState(() {
                              _currentStep = 1;
                            });
                          }
                        },
                        child: Container(
                          color: Colors.red.withOpacity(0.1),
                          height: height,
                        ),
                      ),
                    ],
                  ),
                  VisibilityDetector(
                    key: Key('2'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                          (visibilityInfo.visibleFraction * 100).round();
                      if (visiblePercentage > 50) {
                        setState(() {
                          _currentStep = 2;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.green.withOpacity(0.2),
                      height: height,
                    ),
                  ),
                  VisibilityDetector(
                    key: Key('3'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                          (visibilityInfo.visibleFraction * 100).round();
                      if (visiblePercentage > 50) {
                        setState(() {
                          _currentStep = 3;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.red.withOpacity(0.2),
                      height: height,
                    ),
                  ),
                  VisibilityDetector(
                    key: Key('4'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                      (visibilityInfo.visibleFraction * 100).round();
                      if (visiblePercentage > 50) {
                        setState(() {
                          _currentStep = 4;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.green.withOpacity(0.2),
                      height: height,
                    ),
                  ),


                  VisibilityDetector(
                    key: Key('5'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                      (visibilityInfo.visibleFraction * 100).round();
                      if (visiblePercentage > 50) {
                        setState(() {
                          _currentStep = 5;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.red.withOpacity(0.2),
                      height: height,
                    ),
                  ),
                  VisibilityDetector(
                    key: Key('6'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                      (visibilityInfo.visibleFraction * 100).round();
                      if (visiblePercentage > 50) {
                        setState(() {
                          _currentStep = 6;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.green.withOpacity(0.2),
                      height: height,
                    ),
                  ),
                  VisibilityDetector(
                    key: Key('7'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                      (visibilityInfo.visibleFraction * 100).round();
                      if (visiblePercentage > 50) {
                        setState(() {
                          _currentStep = 7;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.red.withOpacity(0.2),
                      height: height,
                    ),
                  ),
                  VisibilityDetector(
                    key: Key('8'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                      (visibilityInfo.visibleFraction * 100).round();
                      if (visiblePercentage > 50) {
                        setState(() {
                          _currentStep = 8;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.green.withOpacity(0.2),
                      height: height,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              top: height / 2 - (height / 8),
              child: Container(
                height: height / 4,
                child: StepProgressIndicator(
                  totalSteps: _totalSteps,
                  currentStep: _currentStep,
                  selectedColor: Colors.red,
                  unselectedColor: Colors.yellow,
                  direction: Axis.vertical,
                ),
              ),
            ),
          ],
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
        twinkleTime:
            RandomParticleBehaviour.random.nextDouble() * maxTimeTwinkle,
        opacityChangeRate: options.opacityChangeRate * (changed ? -1.0 : 1.0),
        changed: changed,
      );
    }
  }

  @override
  void initParticle(Particle p) {
    super.initParticle(p);

    // Add twinkling info for particle initialization
    final twinkleTime = minTimeTwinkle +
        RandomParticleBehaviour.random.nextDouble() *
            (maxTimeTwinkle - minTimeTwinkle);
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

    if (twinkleInfo.opacityChangeRate > 0 &&
            particle.alpha < particle.targetAlpha ||
        twinkleInfo.opacityChangeRate < 0 &&
            particle.alpha > particle.targetAlpha) {
      // Update the alpha with out opacity rate
      particle.alpha = particle.alpha + delta * twinkleInfo.opacityChangeRate;

      if (twinkleInfo.opacityChangeRate > 0 &&
              particle.alpha > particle.targetAlpha ||
          twinkleInfo.opacityChangeRate < 0 &&
              particle.alpha < particle.targetAlpha) {
        particle.alpha = particle.targetAlpha;
      }

      if (twinkleInfo.changed &&
          (twinkleInfo.opacityChangeRate > 0 &&
                  particle.alpha >= particle.targetAlpha ||
              twinkleInfo.opacityChangeRate < 0 &&
                  particle.alpha <= particle.targetAlpha)) {
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
