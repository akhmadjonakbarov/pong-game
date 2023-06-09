import 'package:flutter/material.dart';
import 'package:pong_game/widgets/widgets.dart';

enum Direction { up, down, left, right }

class Pong extends StatefulWidget {
  const Pong({super.key});

  @override
  State<Pong> createState() => _PongState();
}

class _PongState extends State<Pong> with SingleTickerProviderStateMixin {
  /* Variables */
  // Animations
  Animation<double>? animation;
  AnimationController? controller;

  // Direction class
  Direction vDir = Direction.down;
  Direction hDir = Direction.right;

  // numbers
  double width = 0;
  double height = 0;
  double posX = 0;
  double posY = 0;
  double batWidth = 0;
  double batHeigth = 0;
  double batPosition = 0;

  // functions
  void checkBorders() {
    if (posX <= 0 && hDir == Direction.left) {
      hDir = Direction.right;
    }
    if (posX >= width - 50 && hDir == Direction.right) {
      hDir = Direction.left;
    }
    if (posY >= height - 50 && vDir == Direction.down) {
      vDir = Direction.up;
    }
    if (posY <= 0 && vDir == Direction.up) {
      vDir = Direction.down;
    }
  }

  @override
  void initState() {
    posX = 0;
    posY = 0;
    controller = AnimationController(
      duration: const Duration(minutes: 10000),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 100).animate(controller!);
    animation!.addListener(() {
      setState(() {
        (hDir == Direction.right) ? posX += 1 : posX -= 1;
        (vDir == Direction.down) ? posY += 1 : posY -= 1;
      });
      checkBorders();
    });
    controller!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          height = constraints.maxHeight;
          width = constraints.maxWidth;
          batWidth = width / 5;
          batHeigth = height / 20;
          return Stack(
            children: [
              Positioned(
                top: posY,
                left: posX,
                child: Ball(),
              ),
              Positioned(
                bottom: 0,
                child: Bat(
                  width: batWidth,
                  height: batHeigth,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
