import 'package:flutter/material.dart';
import 'package:projects/xoGame/game_board.dart';
import 'package:projects/xoGame/players_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO_Game',
      locale: const Locale('en'),
      initialRoute: PlayerScreen.routeName,
      routes: {
        PlayerScreen.routeName: (context) => PlayerScreen(),
        GameBoard.routeName: (context) => const GameBoard(),
      },
    );
  }
}
