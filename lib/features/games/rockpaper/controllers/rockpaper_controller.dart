import 'dart:math';

import 'package:get/get.dart';

class RockPaperScissorsController extends GetxController {
  RxString playerMove = ''.obs;
  RxString computerMove = ''.obs;
  RxString resultMessage = ''.obs;

  void playGame(String move) {
    playerMove.value = move;

    final moves = ['Rock', 'Paper', 'Scissors'];
    final randomIndex =
        Random().nextInt(moves.length - 1); //GetUtils.ra(moves.length - 1);
    computerMove.value = moves[randomIndex];

    if (playerMove.value == computerMove.value) {
      resultMessage.value = 'It\'s a tie!';
    } else if ((playerMove.value == 'Rock' &&
            computerMove.value == 'Scissors') ||
        (playerMove.value == 'Paper' && computerMove.value == 'Rock') ||
        (playerMove.value == 'Scissors' && computerMove.value == 'Paper')) {
      resultMessage.value = 'You win!';
    } else {
      resultMessage.value = 'Computer wins!';
    }
  }

  void resetGame() {
    playerMove.value = '';
    computerMove.value = '';
    resultMessage.value = '';
  }
}
