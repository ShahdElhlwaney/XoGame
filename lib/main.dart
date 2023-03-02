import 'package:flutter/material.dart';
import 'package:xo_game/Play/play_screen.dart';

import 'Start/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "PlayScreen":(context)=>PlayScreen()
      },
      home:  StartScreen(),
    );
  }
}


