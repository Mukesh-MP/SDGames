import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/common_widgets/common_appbar.dart';
import 'package:sd_games/features/games/guess/screens/screen.dart';
import 'package:sd_games/features/games/memorygame/screens/memory_screen.dart';
import 'package:sd_games/features/games/rockpaper/screens/rockpaper_screen.dart';
import 'package:sd_games/features/games/tap/screens/tap_screen.dart';
import 'package:sd_games/features/games/tictac/screens/tictac.dart';
import 'package:sd_games/features/games/wordguess/screens/wordguess_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CommonAppBar(appBarTitle: "Your Games", showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 6 / 7),
            children: [
              InkWell(
                onTap: () {
                  Get.to(GuessGame());
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/question.png",
                          ),
                        ),
                      ),
                      const Text("Guess")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(TicTac());
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/tictac.png",
                          ),
                        ),
                      ),
                      const Text("TicTac")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(TapTheButtonPage());
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/tap-here.png",
                          ),
                        ),
                      ),
                      const Text("TapButton")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(MemoryGamePage());
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/corgi.png",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5),
                        child: Text(
                          "Memory Test",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(RockPaperScissorsPage());
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/corgi.png",
                          ),
                        ),
                      ),
                      const Text("RockPaper")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(WordGuessPage());
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/corgi.png",
                          ),
                        ),
                      ),
                      const Text("WordGuess")
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

//MemoryGamePage