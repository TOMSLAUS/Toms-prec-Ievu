import 'package:flutter/material.dart';
import 'views/MainView.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toms prec Ievu',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     initialRoute: MainView.id,
      routes: {
        MainView.id: (context) => MainView(),
      },
    );
  }
}
