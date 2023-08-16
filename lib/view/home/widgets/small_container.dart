import 'dart:io';
import 'package:flutter/material.dart';
import 'package:machine/view/home/widgets/play_icon.dart';

class SmallContainer extends StatelessWidget {
  AsyncSnapshot<String> snapshot;
  SmallContainer({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                image: DecorationImage(
                    image: FileImage(File(snapshot.data!)), fit: BoxFit.cover)),
          ),
          PlayIcon()
        ],
      ),
    );
  }
}
