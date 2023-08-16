import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  double sized;
  PlayIcon({super.key, required,  this.sized=40});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.play_circle_fill_outlined,
        size: sized,
        color: Colors.white,
      ),
    );
  }
}