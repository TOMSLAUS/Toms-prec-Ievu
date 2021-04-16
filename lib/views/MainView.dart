import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:animated_background/animated_background.dart';
import 'package:confetti/confetti.dart';
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
import 'package:http/http.dart' as http;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class MainView extends StatefulWidget {
  static const id = "MainView";
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {

  var titleStyle2 = GoogleFonts.quando(
    color: Colors.white,
    fontSize: 40,
  );
  var textStyle2 = GoogleFonts.judson(
    color: Colors.white,
    fontSize: 20,
  );
  var textStyle3 = GoogleFonts.judson(
    color: Colors.white,
    fontSize: 20,
  );
  var thankYouTextStyle = GoogleFonts.judson(
    color: Colors.white,
    fontSize: 40,
  );
  var mainTitle = GoogleFonts.dancingScript(
    color: Colors.white,
    fontSize: 60,
  );
  bool cardOpened = false;
  bool cardOpened2 = false;
  double imageWidth = 200;
  double imageHeight = 200;
  Color outlineBorderColor = Color(0xFF67DAFF);
  Color borderColor = Color(0xFF007AC1);
  Color mainColor = Color(0xFF007AC1);
  Color cardBackGround = Color(0xFF007AC1);
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
  String name = "", lastName = "", email = "", phoneNumber = "", guestNames = "";
  bool whiskey = false,rum = false,cognac = false,vodka = false,jin = false,champagne = false,whiteVine = false, redVine = false,beer = false;
  Animation _satelliteAnimation;
  AnimationController _satelliteController;
  ConfettiController _controllerBottomCenter;
  String thankYouText = "";

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

  Future<http.Response>newGuest(String name,String lastName, String email, String phoneNumber, String guestNames,
  bool whiskey, bool rum, bool cognac, bool vodka, bool jin, bool champagne, bool whiteVine, bool redVine, bool beer, bool stayingNight) async {
    var po = await http.post(
      "https://tomsprecievu.lv/tpi.php",
      body: {
        'name': name,
        'surname': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'guestNames': guestNames,
        'whiskey': whiskey.toString(),
        'rum': rum.toString(),
        'cognac': cognac.toString(),
        'vodka': vodka.toString(),
        'jin': jin.toString(),
        'champagne': champagne.toString(),
        'whiteVine': whiteVine.toString(),
        'redVine': redVine.toString(),
        'beer': beer.toString(),
        'stayingNight': stayingNight.toString(),
      },
    );
    print(po.body);
    print(po.statusCode);
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
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }
  @override
  void dispose() {
    _controllerBottomCenter.dispose();
    _satelliteController.dispose();
    super.dispose();
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
                              child: Image.asset('images/satellite.png'))),
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
                          child: Stack(
                            children: [
                              Positioned(
                                right: 20,
                                  top: 20,
                                  child: Row(
                                    children: [
                                      TextButton(onPressed: (){
                                        context.locale = Locale('lv');
                                      }, child: Image.asset("assets/images/latvia.png",),
                                      ),
                                      TextButton(onPressed: (){
                                        context.locale = Locale('en');
                                      }, child: Image.asset("assets/images/us.png",),
                                      )
                                    ],
                                  )),
                              Center(
                                child: Text("title",
                                  style: mainTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ).tr(),
                            ),
                        ]
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
                                  "where.title",
                                style: titleStyle2
                                ).tr(),
                                Divider(height: 20,),
                                Text(
                                  "where.text",
                                  style: textStyle2,
                                ).tr(),
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
                                  "when.title",
                                  style: titleStyle2
                                ).tr(),
                                Divider(height: 10,),
                                Text(
                                  "when.text",
                                  style: textStyle2,
                                ).tr(),

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
                          Text("place.title", style: titleStyle2,).tr(),
                          Divider(height: 20,),
                          Container(
                              width: width/2,
                              child: ClipOval(child:Image.asset("assets/images/bersas.jpg",),)),
                          Divider(height: 20,),
                          Text("Bēršas", style: titleStyle2,),
                          Divider(height: 20,),
                          Container(
                            width: width - (width/5),
                            child: Center(
                              child: Text("place.text"
                                , style: textStyle2,).tr(),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(width: imageWidth, height: imageHeight,
                                    child: Image.asset("assets/images/toms.jpg",),),
                                  Divider(height: 20,),
                                  Text("Toms", style: titleStyle2,),
                                  Divider(height: 20,),
                                  Text("people.groom", style: textStyle2,).tr(),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(width: imageWidth, height: imageHeight,
                                    child: Image.asset("assets/images/ieva.jpeg",),),
                                  Divider(height: 20,),
                                  Text("Ieva", style: titleStyle2,),
                                  Divider(height: 20,),
                                  Text("people.bride", style: textStyle2,).tr(),

                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Divider(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(

                                    children: [
                                      Container(width: imageWidth, height: imageHeight,child: Image.asset("assets/images/martins.jpeg"),),
                                      Divider(height: 20,),
                                      Text("Mārtiņš", style: titleStyle2,),
                                      Divider(height: 20,),
                                      Text("people.bestMan", style: textStyle2,).tr(),
                                    ],
                                  ),

                                  Column(

                                    children: [
                                      Container(width: imageWidth, height: imageHeight,
                                        child: Image.asset("assets/images/laura.jpg",),),
                                      Divider(height: 20,),
                                      Text("Laura", style: titleStyle2,),
                                      Divider(height: 20,),
                                      Text("people.maidOfHonnor", style: textStyle2,).tr(),
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
                          Center(child: Text("people.parents", style: titleStyle2,).tr()),
                          Divider(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(width: imageWidth, height: imageHeight,
                                        child: Image.asset("assets/images/arnis.jpeg",),),
                                      Divider(height: 20,),
                                      Text("Arnis", style: textStyle2,),
                                      Column(
                                        children: [
                                          Container(width: imageWidth, height: imageHeight,
                                            child: Image.asset("assets/images/ineta.jpeg",),),
                                          Divider(height: 20,),
                                          Text("Ineta", style: textStyle2,),
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
                                      Container(width: imageWidth, height: imageHeight,
                                        child: Image.asset("assets/images/armands.jpeg",),),
                                      Divider(height: 20,),
                                      Text("Armands", style: textStyle2,),
                                    ],
                                  ),
                                  Column(

                                    children: [
                                      Container(width: imageWidth, height: imageHeight,
                                        child: Image.asset("assets/images/kristine.jpeg",),),
                                      Divider(height: 20,),
                                      Text("Kristīne", style: textStyle2,),
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
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                       Text("rsvp", style: titleStyle2,).tr(),
                      Container(
                        color: cardBackGround,
                        width: width/1.5,
                        child: ExpansionCard(
                          onExpansionChanged: (value){
                            setState(() {
                              cardOpened = value;
                            });
                          },
                          backgroundColor: mainColor,
                          title: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text(
                                  "card1Title"
                                  , style: textStyle3,
                                ).tr(),
                              ],
                            ),
                          ),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 7),
                              child:   Column(
                                children: [
                                  Text("name" , style: textStyle3,).tr(),
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
                                  Text("lastName", style: textStyle3,).tr(),
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
                                  Text("email", style: textStyle3,).tr(),
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
                                  Text("phoneNumber", style: textStyle3,).tr(),
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
                                  Text("guestList" , style: textStyle3,).tr(),
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
                                        hintText: guestNames,
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

                                  Text("stayingNight", style: textStyle3,).tr(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: (){setState(() {
                                          stayingNight = true;
                                        yesButton = selectedButton;
                                        noButton = unselectedButton;
                                      });}, child: Card(color: yesButton, child: Container(height: 50,width: 50,child: Center(child: Text("Jā", style: textStyle3,))),),),
                                      Container(width: 20,),
                                      TextButton(
                                        onPressed: (){setState(() {
                                          stayingNight = false;
                                        noButton = selectedButton;
                                        yesButton = unselectedButton;
                                      });}, child: Card(color:noButton, child: Container(height: 50,width: 50,child: Center(child: Text("Nē", style: textStyle3,))),),),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ), Container(height: 15,),

                         Container(
                           color: cardBackGround,
                           width: width/1.5,
                           child: ExpansionCard(
                             onExpansionChanged: (value){
                               setState(() {
                                 cardOpened2 = value;
                               });
                             },
                             title: Container(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Text(
                                     "alkoTitle"
                                     , style: textStyle3,
                                   ).tr(),

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
                                         title: Text("whiskey", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                       setState(() {
                                         whiskey = value;
                                       });
                                     }),
                                     CheckboxListTile(
                                         value: rum,
                                         title: Text("rum", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                           setState(() {
                                             rum = value;
                                           });
                                         }),
                                     CheckboxListTile(
                                         value: cognac,
                                         title: Text("cognac", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                           setState(() {
                                             cognac = value;
                                           });
                                         }),
                                     CheckboxListTile(
                                         value: vodka,
                                         title: Text("vodka", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                           setState(() {
                                             vodka = value;
                                           });
                                         }),
                                     CheckboxListTile(
                                         value: jin,
                                         title: Text("jin", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                           setState(() {
                                             jin = value;
                                           });
                                         }),
                                     CheckboxListTile(
                                         value: champagne,
                                         title: Text("champagne", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                           setState(() {
                                             champagne = value;
                                           });
                                         }),
                                     CheckboxListTile(
                                         value: whiteVine,
                                         title: Text("whiteVine", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                           setState(() {
                                             whiteVine = value;
                                           });
                                         }),
                                     CheckboxListTile(
                                         value: redVine,
                                         title: Text("redVine", style: textStyle3,).tr(),
                                         onChanged: (bool value){
                                           setState(() {
                                             redVine = value;
                                           });
                                         }),
                                     CheckboxListTile(
                                         value: beer,
                                         title: Text("beer", style: textStyle3,).tr(),
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
                         ElevatedButton(
                           child: Text("sendForm", style: textStyle3,).tr(),
                           onPressed: (){
                             setState(() {
                               thankYouText = "thankYou".tr();
                             });
                            // print(name+ lastName+email+ phoneNumber+ guestNames+ whiskey.toString()+ rum.toString());
                             newGuest(this.name, this.lastName, this.email, this.phoneNumber, this.guestNames, this.whiskey, this.rum, this.cognac, this.vodka, this.jin, this.champagne, this.whiteVine, this.redVine, this.beer, this.stayingNight);
                             _controllerBottomCenter.play();
                             name = "";
                             lastName = "";
                             email = "";
                             phoneNumber = "";
                             guestNames = "";
                             whiskey = false;
                             rum = false;
                             cognac = false;
                             vodka = false;
                             jin = false;
                             champagne = false;
                             whiteVine = false;
                             redVine = false;
                             beer = false;
                             },
                         ),
                         Container(height: 35,),

                         Center(
                           child: Container(
                             width: width - (width/5),
                             child: Text(thankYouText,
                               style: thankYouTextStyle,),
                           ),
                         ),
                         Container(height: 35,),

                         Container(
                           width: width - (width/5),
                           child: Text("gift",
                             style: textStyle2,).tr(),
                         ),
                      ],
                    ),
                       ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF3475AD), Color(0xFF468FCF)]
                          )
                      ),
                      height: cardOpened || cardOpened2 ? height *2.8 : height ,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: _controllerBottomCenter,
                blastDirection: -3.14 / 2,
                emissionFrequency: 0.01,
                numberOfParticles: 20,
                maxBlastForce: 100,
                minBlastForce: 80,
                gravity: 0.3,
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