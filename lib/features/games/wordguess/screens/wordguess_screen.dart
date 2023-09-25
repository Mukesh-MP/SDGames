import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/games/wordguess/controller/wordguess_controller.dart';

class WordGuessPage extends StatelessWidget {
  final WordGuessController wordguessController =
      Get.put(WordGuessController());

  WordGuessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Guessing Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              wordguessController.guessedWord,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: List.generate(
                26,
                (index) => ElevatedButton(
                  onPressed: () {
                    wordguessController
                        .guessLetter(String.fromCharCode(65 + index));
                  },
                  child: Text(String.fromCharCode(65 + index)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          wordguessController.startGame();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
