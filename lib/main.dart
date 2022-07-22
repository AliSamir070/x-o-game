import 'package:flutter/material.dart';
import 'package:x_o_game/modules/splash.dart';
import 'package:x_o_game/modules/start_screen.dart';

import 'modules/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        GameScreen.Route:(context) => GameScreen(),
        StartScreen.Route:(context)=>StartScreen(),
        SplashScreen.Route:(context)=>SplashScreen()
      },
      initialRoute: StartScreen.Route,
    );
  }
}

