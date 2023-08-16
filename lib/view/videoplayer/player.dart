import 'package:flutter/material.dart';
import 'package:machine/video_list.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  int index;
  Player({super.key, required this.index,});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState;
    videoController(videoPath: videoPathList[widget.index]);
  }

  void videoController({required videoPath}) {
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoPath))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            child: _controller.value.isInitialized
                ? Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: SizedBox(
                          height: kheight * 1,
                          width: kwidth * 1,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
