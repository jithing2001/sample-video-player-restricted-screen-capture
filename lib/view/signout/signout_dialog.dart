import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine/services/authentication.dart';
import 'package:machine/view/login/login.dart';

class Signout extends StatelessWidget {
  const Signout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          const Text('Are you sure?'),
          SizedBox(height: kheight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () async {
                    await Authentication().signOut();
                    Get.offAll(const Login());
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontSize: 22, color: Colors.green),
                  )),
              SizedBox(width: kwidth * 0.05),
              InkWell(
                  onTap: () => Get.back(),
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 22, color: Colors.red),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
