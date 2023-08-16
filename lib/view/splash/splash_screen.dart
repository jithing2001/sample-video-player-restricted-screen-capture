import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine/view/home/homescreen.dart';
import 'package:machine/view/login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var kheight = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
      final userLogin = FirebaseAuth.instance.currentUser;
      if (userLogin == null) {
        Get.off(const Login());
      } else {
        Get.off(const HomeScreen());
      }
    });
    return Scaffold(
        body: Stack(
      children: [
        const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image(
            image: AssetImage(
                'assets/images/2d8dd65d1e541e6239f063b4d4ed6dda.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: kheight * 0.4,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Video Test',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const CircularProgressIndicator()
          ],
        )
      ],
    ));
  }
}
