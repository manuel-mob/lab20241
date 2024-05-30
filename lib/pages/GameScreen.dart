import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Color currentColor = Colors.blue; // Initial color
  int score = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    //changeColor();
    //tartTimer();
  }

  @override
  void dispose() {
    //timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 10), (_) => changeColor());
  }

  void changeColor() {
    setState(() {
      currentColor = Color((Random().nextDouble() * 0x00ffffff).toInt()); // Generate random color
    });
  }

  void handleSwipe(DragStartDetails details) {
    SwipeDirection swipeDirection = getSwipeDirection(details);
    if (isCorrectSwipe(swipeDirection, currentColor)) {
      setState(() {
        score++;
        changeColor();
      });
    } else {
      // Handle incorrect swipe (e.g., display error message)
    }
  }

  SwipeDirection getSwipeDirection(DragStartDetails details) {
    final dx = details.globalPosition.dx - details.localPosition.dx;
    final dy = details.globalPosition.dy - details.localPosition.dy;
    if (dy.abs() > dx.abs()) {
      return dy > 0 ? SwipeDirection.down : SwipeDirection.up;
    } else {
      return dx > 0 ? SwipeDirection.right : SwipeDirection.left;
    }
  }

  bool isCorrectSwipe(SwipeDirection swipeDirection, Color color) {
    switch (color) {
      case Colors.red:
        return swipeDirection == SwipeDirection.up;
      case Colors.yellow:
        return swipeDirection == SwipeDirection.down;
      case Colors.blue:
        return swipeDirection == SwipeDirection.left;
      case Colors.green:
        return swipeDirection == SwipeDirection.right;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragStart: handleSwipe,
        onVerticalDragStart: handleSwipe,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: currentColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Text(
                "Score: $score",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum SwipeDirection { up, down, left, right }
