import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordGuessController extends GetxController {
  final List<String> words = [
    'apple',
    'banana',
    'orange',
    'grape',
    'watermelon',
    'strawberry',
    'kiwi',
    'pineapple',
    'mango',
    'pear'
  ];
  String targetWord = '';
  String guessedWord = '';

  void startGame() {
    targetWord = words[Random().nextInt(9)];
    guessedWord = ''.padRight(targetWord.length, '_');
  }

  void guessLetter(String letter) {
    List<String> updatedGuessedWord = guessedWord.split('');

    for (int i = 0; i < targetWord.length; i++) {
      if (targetWord[i] == letter) {
        updatedGuessedWord[i] = letter;
      }
    }

    guessedWord = updatedGuessedWord.join('');

    if (guessedWord == targetWord) {
      Get.defaultDialog(
        title: 'Congratulations!',
        middleText: 'You guessed the word!',
        textConfirm: 'Play Again',
        confirmTextColor: Colors.white,
        onConfirm: () {
          startGame();
          Get.back();
        },
      );
    }
  }
}
