import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine/controller/thumbnail_controller.dart';
import 'package:machine/video_list.dart';
import 'package:machine/view/home/widgets/large_container.dart';
import 'package:machine/view/home/widgets/small_container.dart';
import 'package:machine/view/signout/signout_dialog.dart';
import 'package:machine/view/videoplayer/player.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var kheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 5, 6, 8), Colors.white])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black.withOpacity(0.3),
            title: const Text(
              'HomeScreen',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.dialog(const AlertDialog(
                      content: Signout(),
                    ));
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: kheight * 0.03),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Top Rated Video',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: kheight * 0.01),
                  FutureBuilder(
                    future: ThumbnailController()
                        .getThumbnail(video: videoPathList[0]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Transform.scale(
                          scale: 0.2,
                          child: const CircularProgressIndicator(
                            strokeWidth: 5,
                            color: Colors.white,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Error loading thumbnail');
                      } else {
                        return InkWell(
                          onTap: () {
                            Get.to(Player(index: 0));
                          },
                          child: LargeContainer(
                              kheight: kheight, snapshot: snapshot),
                        );
                      }
                    },
                  ),
                  SizedBox(height: kheight * 0.01),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sample Videos',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: kheight * 0.01),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: videoPathList.length - 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: ThumbnailController()
                            .getThumbnail(video: videoPathList[index + 1]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Transform.scale(
                              scale: 0.2,
                              child: const CircularProgressIndicator(
                                strokeWidth: 5,
                                color: Colors.white,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Error loading thumbnail');
                          } else {
                            return InkWell(
                              onTap: () {
                                Get.to(Player(index: index + 1));
                              },
                              child: SmallContainer(snapshot: snapshot),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
