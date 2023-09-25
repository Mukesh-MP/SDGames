import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/games/rockpaper/controllers/rockpaper_controller.dart';

class RockPaperScissorsPage extends StatelessWidget {
  final RockPaperScissorsController _rockpaperController =
      Get.put(RockPaperScissorsController());

  RockPaperScissorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock, Paper, Scissors Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Player: ", style: TextStyle(fontSize: 20.0)),
                  Text(
                    _rockpaperController.playerMove.value,
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ],
              )),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Computer: ", style: TextStyle(fontSize: 20.0)),
                  Text(
                    _rockpaperController.computerMove.value,
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ],
              )),
          const SizedBox(height: 20.0),
          Obx(() => Text(
                _rockpaperController.resultMessage.value,
                style: TextStyle(
                    color:
                        _rockpaperController.resultMessage.value == 'You win!'
                            ? Colors.green
                            : _rockpaperController.resultMessage.value ==
                                    'Computer wins!'
                                ? Colors.red
                                : Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    child: const Text('Rock'),
                    onPressed: () => _rockpaperController.playGame('Rock'),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 249, 156, 156))),
                    child: const Text('Paper'),
                    onPressed: () => _rockpaperController.playGame('Paper'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 113, 113, 247))),
                    child: const Text('Scissors'),
                    onPressed: () => _rockpaperController.playGame('Scissors'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100.0),
          ElevatedButton(
            onPressed: _rockpaperController.resetGame,
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
