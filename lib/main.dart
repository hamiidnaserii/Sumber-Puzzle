import 'package:flutter/material.dart';
import 'package:sumber_puzzle/pages/GamePage.dart';
import 'package:sumber_puzzle/pages/MenuPage.dart';
import 'package:sumber_puzzle/pages/SplashPage.dart';
import 'package:sumber_puzzle/src/my_variables.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sumber Puzzle',
    theme: ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: "Nova"
    ),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      MyRoute.SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
      MyRoute.MENU_SCREEN: (BuildContext context) => MyHomePage(),
      MyRoute.GAME_SCREEN: (BuildContext context) => GamePage(),

    },
    initialRoute: MyRoute.SPLASH_SCREEN,
    // home: SplashScreen(),
  ));
}


