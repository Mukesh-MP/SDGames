import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splashcontroller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController _splashController = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
              Color.fromARGB(175, 50, 93, 158),
              Color.fromARGB(225, 30, 54, 91),
              Color.fromARGB(255, 30, 54, 91),
              Color.fromARGB(226, 30, 54, 91),
              Color.fromARGB(166, 50, 93, 158)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: const AssetImage("assets/images/sdgames.jpg"),
                height: MediaQuery.of(context).size.height * .35,
              ),
              //     child: Text(
              //   "Welcome to SdGames",
              //   style: TextStyle(
              //       color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
              // )
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * .06, top: 5),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Version 1.0.0",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
