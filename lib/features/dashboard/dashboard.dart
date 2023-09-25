import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/common_widgets/common_appbar.dart';
import 'package:sd_games/features/games/home/screens/homescreen.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  Uri url = Uri.parse('https://google.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        appBarTitle: "DashBoard",
      ),
      body: GridView.count(crossAxisCount: 2, children: [
        InkWell(
          onTap: () {
            Get.to(const MyHomePage());
          },
          child: Card(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                children: [
                  Image(
                      image: const AssetImage("assets/images/corgi.png"),
                      height: MediaQuery.of(context).size.height * .18),
                  const Text("Games",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            launchUrl(mode: LaunchMode.externalApplication, url);
          },
          child: Card(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: Column(
                children: [
                  Image(
                      image: const AssetImage("assets/images/maths.png"),
                      height: MediaQuery.of(context).size.height * .18),
                  const Text("MathQ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
