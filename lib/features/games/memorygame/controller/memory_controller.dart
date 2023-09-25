import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemoryGameController extends GetxController {
  RxList<String> cardImages = [
    '🐶',
    '🐱',
    '🐭',
    '🐹',
    '🐰',
    '🐻',
    '🦊',
    '🐸',
    '🐶',
    '🐱',
    '🐭',
    '🐹',
    '🐰',
    '🐻',
    '🦊',
    '🐸',
  ].obs;

  RxList<String> flippedCards = List<String>.empty(growable: true).obs;
  RxList<String> matchedCards = List<String>.empty(growable: true).obs;
  RxInt clickedIndex = 0.obs;
  RxInt clickedIndex2 = 0.obs;
  String? clickedCard;
  int clickNo = 0;
  int maxNumOfAttempt = 30;

  void flipCard(int index) {
    clickNo++;
    if (clickNo <= maxNumOfAttempt) {
      if (flippedCards.length == 1) {
        clickedIndex2 = clickedIndex;
      }
      clickedIndex = index.obs;
      if (!flippedCards.contains(cardImages[index]) &&
          !matchedCards.contains(cardImages[index])) {
        flippedCards.add(cardImages[index]);
        if (flippedCards.length == 2) {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (flippedCards[0] == flippedCards[1]) {
              matchedCards.addAll(flippedCards);
              flippedCards.clear();
              if (matchedCards.length == cardImages.length) {
                _showGameCompleteDialog();
              }
            } else {
              flippedCards.clear();
            }
          });
        }
      } else if (!matchedCards.contains(cardImages[index]) &&
          clickedIndex != clickedIndex2) {
        flippedCards.add(cardImages[index]);
        if (flippedCards[0] == flippedCards[1]) {
          matchedCards.addAll(flippedCards);
          flippedCards.clear();
          if (matchedCards.length == cardImages.length) {
            _showGameCompleteDialog();
          }
        }
      }
    } else {
      _showGameFailDialog();
    }
  }

  void restartGame() {
    flippedCards.clear();
    matchedCards.clear();
    cardImages.shuffle();
    clickNo = 0;
  }

  void _showGameCompleteDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Congratulations!'),
        content: const Text('You completed the game.'),
        actions: [
          ElevatedButton(
            child: const Text('Play Again'),
            onPressed: () {
              Get.back();
              restartGame();
            },
          ),
        ],
      ),
    );
  }

  void _showGameFailDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Oh! You failed'),
        content: Text('Exceeded max num of attempts $maxNumOfAttempt.'),
        actions: [
          ElevatedButton(
            child: const Text('Play Again'),
            onPressed: () {
              Get.back();
              restartGame();
            },
          ),
        ],
      ),
    );
  }
}
