import 'dart:io';

import 'package:flutter/material.dart';
import 'package:machine/view/home/widgets/play_icon.dart';

class LargeContainer extends StatelessWidget {
  AsyncSnapshot<String> snapshot;
  LargeContainer({super.key, required this.kheight, required this.snapshot});

  final double kheight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            height: kheight * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                image: DecorationImage(
                    image: FileImage(File(snapshot.data!)), fit: BoxFit.cover)),
          ),
          Positioned.fill(
            child: PlayIcon(sized: 60),
          ),
        ],
      ),
    );
  }
}
