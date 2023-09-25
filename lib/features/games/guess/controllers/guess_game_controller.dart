import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuessGameController extends GetxController {
  final _random = Random();
  final _targetNumber = 0.obs;
  var guessNumber = 0.obs;
  final _message = ''.obs;

  int get targetNumber => _targetNumber.value;
  int get guessNumber1 => guessNumber.value;
  String get message => _message.value;
  int attempt = 0;
  int maxAttempt = 6;

  void startGame() {
    _targetNumber.value = _random.nextInt(100);
    guessNumber.value = 0;
    _message.value = '';
    attempt = 0;
  }

  void checkGuess() {
    attempt++;
    if (attempt <= maxAttempt) {
      if (guessNumber.value == _targetNumber.value) {
        _message.value = 'Congratulations! You guessed the number!';
      } else if (guessNumber.value < _targetNumber.value) {
        _message.value = 'Try a higher number.';
      } else {
        _message.value = 'Try a lower number.';
      }
    } else {
      Get.defaultDialog(
        title: 'Failed!',
        middleText: 'Exceeded max attempt $maxAttempt',
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
