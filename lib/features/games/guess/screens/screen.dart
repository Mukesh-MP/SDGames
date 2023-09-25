import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/games/guess/controllers/guess_game_controller.dart';

class GuessGame extends StatelessWidget {
  final GuessGameController _gameController = Get.put(GuessGameController());

  GuessGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Guessing Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Guess a number between 0 and 100:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  _gameController.message,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _gameController.message ==
                              'Congratulations! You guessed the number!'
                          ? Colors.green
                          : Colors.black),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _gameController.checkGuess(),
                  child: const Text('Check'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _gameController.startGame(),
                  child: const Text('Restart'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'Previous guess: ${_gameController.guessNumber}',
                  style: const TextStyle(fontSize: 16),
                )),
            const SizedBox(height: 20),
            Slider(
              min: 0,
              max: 100,
              divisions: 100,
              value: _gameController.guessNumber.toDouble(),
              onChanged: (value) =>
                  _gameController.guessNumber.value = value.toInt(),
            ),
          ],
        ),
      ),
    );
  }
}
