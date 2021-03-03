import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_sinusoidals/flutter_sinusoidals.dart';


class MainView extends StatefulWidget {
  static const id = "MainView";
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  Color outlineBorderColor = Color(0xFF67DAFF);
  Color borderColor = Color(0xFF007AC1);
  Color cardBackGround = Colors.red;
  double width, height;
  int _totalSteps = 7;
  int _currentStep = 1;
  ScrollController _scrollController;
  double previous = 0;
  double next = 0;
  double position = 0;
  bool hasBennBuilt = false;
  List <Widget> guestList = [];
  bool stayingNight = false;
Color yesButton = Colors.blue;
Color noButton = Colors.blue;
Color selectedButton = Colors.blueGrey;
Color unselectedButton = Colors.blue;
  String name, lastName, email, phoneNumber, guestNames;
  bool whiskey = false,rum = false,konjac = false,vodka = false,jin = false,champagne = false,whiteVine = false, redVine = false,beer = false;
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
/*
  void addToGuestList(){
      guestList.add(GuestListMaker());
      setState(() {});

  }
*/
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          height: height,
                          width: width,
                          child: Center(
                              child: AutoSizeText("Toms prec Ievu",
                                style: GoogleFonts.dancingScript(
                                    color: Colors.white,
                                    fontSize: 40,
                                ),
                                minFontSize: 20,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ),
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                          width: width/2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Kur",
                                style: TextStyle(fontSize: 30, color: Colors.white),
                                ),
                                Divider(height: 10,),
                                Text(
                                  "Laulību ceremonija notiks āgenskalna baznīcā.",
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),

                          ),
                          Container(
                            width: width/2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Kad",
                                  style: TextStyle(fontSize: 30, color: Colors.white),
                                ),
                                Divider(height: 10,),
                                Text(
                                  "Laulību ceremonija notiks 2021. gada 16 jūlijā.",
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),

                              ],
                            ),

                          ),
                        ],
                      ),
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
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF000000).withOpacity(0.1), Color(0xFF092742).withOpacity(0.5)]
                          )
                      ),
                      height: height,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Svinību vieta", style: TextStyle(fontSize: 30, color: Colors.white),),
                          Divider(height: 20,),
                          Container(
                              width: width/2,
                              child: ClipOval(child:Image.asset("assets/images/bersas.jpg",),)),
                          Divider(height: 20,),
                          Text("Bēršas", style: TextStyle(fontSize: 30, color: Colors.white),),
                          Divider(height: 20,),
                          Container(
                            width: width - (width/5),
                            child: Center(
                              child: Text("Mazmežotnes muiža - brīnišķīga vieta pie dabas, piedāvājot viesiem nakšņošanu"
                                  " muižas viesnīcā, gardu ēdināšanu gan restorānā, gan lielos pasākumos, "
                                  "kā arī plašas telpas svinībām, kāzām un semināriem, spa kompleksu ar dažādām pirtīm, "
                                  "vannām un masāžām, bet aktīvās atpūtas cienītājiem un dabas baudītājiem braucienus ar velosipēdiem,"
                                  " laivām un pastaigas pa dabas taku un apkārtnes celiņiem."
                                , style: TextStyle(fontSize: 20, color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(width: 130, height: 130,color: Colors.white,),
                                  Divider(height: 20,),
                                  Text("Toms", style: TextStyle(fontSize: 30, color: Colors.white),),
                                  Divider(height: 20,),
                                  Text("Līgavainis", style: TextStyle(fontSize: 15, color: Colors.white),),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(width: 130, height: 130,color: Colors.white,),
                                  Divider(height: 20,),
                                  Text("Ieva", style: TextStyle(fontSize: 30, color: Colors.white),),
                                  Divider(height: 20,),
                                  Text("Līgava", style: TextStyle(fontSize: 15, color: Colors.white),),

                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Vedēji", style: TextStyle(fontSize: 30, color: Colors.white),),
                              Divider(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(

                                    children: [
                                      Container(width: 130, height: 130,child: Image.asset("assets/images/martins.jpeg"),),
                                      Divider(height: 20,),
                                      Text("Mārtiņš", style: TextStyle(fontSize: 30, color: Colors.white),),
                                    ],
                                  ),

                                  Column(

                                    children: [
                                      Container(width: 130, height: 130,
                                        child: Image.asset("assets/images/laura.jpg",),),
                                      Divider(height: 20,),
                                      Text("Laura", style: TextStyle(fontSize: 30, color: Colors.white),),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF092742).withOpacity(0.5), Color(0xFF1A4C78).withOpacity(1)]
                          )
                      ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Ģimene", style: TextStyle(fontSize: 30, color: Colors.white),),
                          Divider(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(width: 130, height: 130,color: Colors.white,),
                                      Divider(height: 20,),
                                      Text("Arnis", style: TextStyle(fontSize: 30, color: Colors.white),),
                                      Column(
                                        children: [
                                          Container(width: 130, height: 130,color: Colors.white,),
                                          Divider(height: 20,),
                                          Text("Ineta", style: TextStyle(fontSize: 30, color: Colors.white),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),


                              Column(
                                children: [
                                  Column(

                                    children: [
                                      Container(width: 130, height: 130,color: Colors.white,),
                                      Divider(height: 20,),
                                      Text("Armands", style: TextStyle(fontSize: 30, color: Colors.white),),
                                    ],
                                  ),
                                  Column(

                                    children: [
                                      Container(width: 130, height: 130,color: Colors.white,),
                                      Divider(height: 20,),
                                      Text("Kristīne", style: TextStyle(fontSize: 30, color: Colors.white),),
                                    ],
                                  )
                                ],
                              )

                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF1A4C78), Color(0xFF3475AD)]
                          )
                      ),
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
                       child: Container(
                         child: SingleChildScrollView(
                           child: Column(
                       children: [
                       Text("Reģistrācija", style: TextStyle(fontSize: 30, color: Colors.white),),
                      Container(
                        color: cardBackGround,
                        width: width/2,
                        child: ExpansionCard(
                            background: Image.network('https://media2.giphy.com/media/61TxnT46X71jsXcL9Y/giphy.gif'),
                            title: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Reģistrācija",
                                  ),
                                  Text(
                                    "Šeit ieraksti info par sevi utt.",
                                  ),
                                ],
                              ),
                            ),
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                child:   Column(
                                  children: [
                                    Text("Vārds"),
                                    Container(height: 15,),
                                    Container(
                                      color: Colors.blueAccent,
                                      width: width/2,
                                      child: TextFormField(
                                        initialValue: name,
                                        onChanged: (value){
                                          name = value;
                                        },
                                        style: TextStyle(color: Colors.white),
                                        decoration: new InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
                                          ),
                                        ),),
                                    ),
                                    Container(height: 30,),
                                    Text("Uzvārds"),
                                    Container(height: 15,),
                                    Container(
                                      color: Colors.blueAccent,
                                      width: width/2,
                                      child: TextFormField(
                                        initialValue: lastName,
                                        onChanged: (value){
                                          lastName = value;
                                        },
                                        style: TextStyle(color: Colors.white),
                                        decoration: new InputDecoration(
                                         hintText: "teksts1",
                                          //labelText: "teksts2",
                                        //  border: OutlineInputBorder(
                                         //   borderSide: BorderSide(color: outlineBorderColor, width: 10.0),
                                        //  ),
                                         focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
                                         ),
                                        ),),
                                    ),
                                    Container(height: 30,),
                                    Text("E-pasts"),
                                    Container(height: 15,),
                                    Container(
                                      color: Colors.blueAccent,
                                      width: width/2,
                                      child: TextFormField(
                                        initialValue: email,
                                        onChanged: (value){
                                          email = value;
                                        },
                                        style: TextStyle(color: Colors.white),
                                        validator: emailValidator,
                                        decoration: new InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
                                          ),
                                        ),),
                                    ),
                                    Container(height: 30,),
                                    Text("Tel. Nr."),
                                    Container(height: 15,),
                                    Container(
                                      color: Colors.blueAccent,
                                      width: width/2,
                                      child: TextFormField(
                                        initialValue: phoneNumber,
                                        onChanged: (value){
                                          phoneNumber = value;
                                        },
                                        style: TextStyle(color: Colors.white),
                                        validator: phoneNumberValidator,
                                        decoration: new InputDecoration(
                                          hintText: phoneNumber,
                                          hintStyle: TextStyle(color: Colors.white),
                                          //labelText: "teksts2",
                                          //  border: OutlineInputBorder(
                                          //   borderSide: BorderSide(color: outlineBorderColor, width: 10.0),
                                          //  ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
                                          ),
                                        ),),
                                    ),Container(height: 30,),
                                    Text("Viesu vārdi."),
                                    Container(height: 15,),
                                    Container(
                                      color: Colors.blueAccent,
                                      width: width/2,
                                      child: TextFormField(
                                        initialValue: guestNames ,
                                        onChanged: (value){
                                          guestNames = value;
                                        },
                                        style: TextStyle(color: Colors.white),
                                        validator: phoneNumberValidator,
                                        decoration: new InputDecoration(
                                          hintText: phoneNumber,
                                          hintStyle: TextStyle(color: Colors.white),
                                          //labelText: "teksts2",
                                          //  border: OutlineInputBorder(
                                          //   borderSide: BorderSide(color: outlineBorderColor, width: 10.0),
                                          //  ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
                                          ),
                                        ),),
                                    ),
                                    Container(height: 40,),

                                    Text("Vai vajadzīgas nakts mājas?"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        FlatButton(
                                          onPressed: (){setState(() {
                                          yesButton = selectedButton;
                                          noButton = unselectedButton;
                                        });}, child: Card(color: yesButton, child: Container(height: 50,width: 50,child: Center(child: Text("Jā"))),),),
                                        Container(width: 20,),
                                        FlatButton(
                                          onPressed: (){setState(() {
                                          noButton = selectedButton;
                                          yesButton = unselectedButton;
                                        });}, child: Card(color:noButton, child: Container(height: 50,width: 50,child: Center(child: Text("Nē"))),),),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ],
                        ),
                      ), Container(height: 15,),
                           Text("Kādam alkoholam tu / ģimene dod priekšroku?", style: TextStyle(fontSize: 30, color: Colors.white),),
                           Container(
                             color: cardBackGround,
                             width: width/2,
                             child: ExpansionCard(
                               background: Image.network('https://media2.giphy.com/media/61TxnT46X71jsXcL9Y/giphy.gif'),
                               title: Container(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                     Text(
                                       "Kādam alko tu dod priekšriku",
                                     ),
                                     Text(
                                       "alko teksts",
                                     ),
                                   ],
                                 ),
                               ),
                               children: <Widget>[
                                 Container(
                                   margin: EdgeInsets.symmetric(horizontal: 7),
                                   child:   Column(
                                     children: [
                                       CheckboxListTile(
                                           value: whiskey,
                                           title: Text("Viskijs"),
                                           onChanged: (bool value){
                                         setState(() {
                                           whiskey = value;
                                         });
                                       }),
                                       CheckboxListTile(
                                           value: rum,
                                           title: Text("Rums"),
                                           onChanged: (bool value){
                                             setState(() {
                                               rum = value;
                                             });
                                           }),
                                       CheckboxListTile(
                                           value: konjac,
                                           title: Text("Konjaks"),
                                           onChanged: (bool value){
                                             setState(() {
                                               konjac = value;
                                             });
                                           }),
                                       CheckboxListTile(
                                           value: vodka,
                                           title: Text("Degvīns"),
                                           onChanged: (bool value){
                                             setState(() {
                                               vodka = value;
                                             });
                                           }),
                                       CheckboxListTile(
                                           value: jin,
                                           title: Text("Džins"),
                                           onChanged: (bool value){
                                             setState(() {
                                               jin = value;
                                             });
                                           }),
                                       CheckboxListTile(
                                           value: champagne,
                                           title: Text("Šampanietis"),
                                           onChanged: (bool value){
                                             setState(() {
                                               champagne = value;
                                             });
                                           }),
                                       CheckboxListTile(
                                           value: whiteVine,
                                           title: Text("Baltvīns"),
                                           onChanged: (bool value){
                                             setState(() {
                                               whiteVine = value;
                                             });
                                           }),
                                       CheckboxListTile(
                                           value: redVine,
                                           title: Text("Sarkanvīns"),
                                           onChanged: (bool value){
                                             setState(() {
                                               redVine = value;
                                             });
                                           }),
                                       CheckboxListTile(
                                           value: beer,
                                           title: Text("Alus"),
                                           onChanged: (bool value){
                                             setState(() {
                                               beer = value;
                                             });
                                           })
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Container(height: 15,),
                           RaisedButton(
                             color: Colors.red,
                             child: Text("Nosūtīt anketu!"),
                             onPressed: (){
                               print("pressed");
                             },
                           ),
                      ],
                    ),
                         ),
                       ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF3475AD), Color(0xFF468FCF)]
                          )
                      ),
                      height: height,
                      width: width,
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
                      child: Stack(
                          children : [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF468FCF)
                              ),
                              height: height,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                color: Color(0xFFFFe0b2),
                                width: width,
                                height: height * 0.50,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom:  height / 2,// - (height / 10),
                              child: Container(
                                child: Sinusoidals(
                                  itemCount: 3,
                                  builder: (context, index) {
                                    return SinusoidalItem(
                                      model: SinusoidalModel(
                                        formular: WaveFormular.travelling,
                                        amplitude: 15,
                                        waves: 3,
                                        translate: 5.0 * (index + 1),
                                        center: 5.0 * (index + 1),
                                      ),
                                      child: Container(
                                        height: 50,
                                        color: Colors.lightBlueAccent,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ]
                      ),

                      decoration: BoxDecoration(
                        color: Color(0xFF468FCF)
                      ),
                      height: height,
                      width: width,
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
/*
class GuestListMaker extends StatefulWidget {
  const GuestListMaker();

 // final Color color;
  //final Widget child;

  _GuestListMakerState createState() => _GuestListMakerState();
}

class _GuestListMakerState extends State<GuestListMaker> {
  @override
  Widget build(BuildContext context) {
    return Container(
   child: Row(
    children: [
      Container(
        width: MediaQuery.of(context).size.width/3,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val, password),
          decoration: new InputDecoration(
            hintText: "yeksts",
            hintStyle: TextStyle(color: Colors.white),
            //labelText: "teksts2",
            //  border: OutlineInputBorder(
            //   borderSide: BorderSide(color: outlineBorderColor, width: 10.0),
            //  ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: outlineBorderColor, width: 2.0),
            ),
          ),),
      ),
    ],
    )
    );
  }
}
*/
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



final phoneNumberValidator = MultiValidator([
  RequiredValidator(errorText: 'Telefona numurs ir obligāts'),
  PatternValidator(r'[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+', errorText: 'Nepareizi ievadīts telefona numurs')
]);

final emailValidator = MultiValidator([
RequiredValidator(errorText: 'E-pasts ir obligāts.'),
PatternValidator(r'[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+', errorText: 'Nepareizi ievadīts ēpasts')
]);

String password;