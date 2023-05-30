import 'package:flutter/material.dart';
import 'package:pong_game/widgets/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pong Game',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Pong'),
          ),
          body: SafeArea(
            child: Pong(),
          )),
    );
  }
}
