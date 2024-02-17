import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';


class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 250,
          // ),
          Center(
              child: Image.asset("assets/image/img_vocaject.png",
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.5)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Vocational",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 22,
                      color: greenColor,
                      fontWeight: FontWeight.bold)),
                      SizedBox(
            width: 10,
          ),
              Text("Project",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 22,
                      color: greenColor,
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}
