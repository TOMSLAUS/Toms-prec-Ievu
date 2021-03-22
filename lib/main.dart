import 'package:flutter/material.dart';
import 'views/MainView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 runApp(
   EasyLocalization(
     supportedLocales: [Locale('lv'), Locale('en')],
       startLocale: Locale('lv'),
     path: 'assets/translations', // <-- change the path of the translation files
     fallbackLocale: Locale('en'),
     child: MyApp()
 ),);
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
