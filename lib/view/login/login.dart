import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:machine/services/authentication.dart';
import 'package:machine/view/home/homescreen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 5, 6, 8), Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: kheight * 0.7,
                  width: kwidth * 0.9,
                  child: Lottie.asset('assets/images/animation_lle6tgqn.json'),
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  UserCredential cred =
                      await Authentication().signInWithGoogle();

                  if (cred != null) {
                    Get.offAll(HomeScreen());
                  } else {
                    Get.snackbar('error', 'User null');
                  }
                },
                child: const Text('Signin With Google'))
          ],
        )),
      ),
    );
  }
}
