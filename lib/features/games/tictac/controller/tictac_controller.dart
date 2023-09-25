import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Player { X, O }

class TicTacController extends GetxController {
  var currentPlayer = Player.X.obs;
  var board = List.generate(3, (_) => List.generate(3, (_) => '').obs);

  void markCell(int row, int col) {
    if (board[row][col].isEmpty) {
      board[row][col] = (currentPlayer.value.name).toString();
      checkWinner(row, col);
      togglePlayer();
    }
  }

  void checkWinner(int row, int col) {
    String player = currentPlayer.value.name.toString();

    // Check rows
    if (board[row][0] == player &&
        board[row][1] == player &&
        board[row][2] == player) {
      showWinnerDialog(player);
    }

    // Check columns
    if (board[0][col] == player &&
        board[1][col] == player &&
        board[2][col] == player) {
      showWinnerDialog(player);
    }

    // Check diagonal
    if ((board[0][0] == player &&
            board[1][1] == player &&
            board[2][2] == player) ||
        (board[0][2] == player &&
            board[1][1] == player &&
            board[2][0] == player)) {
      showWinnerDialog(player);
    }

    // Check for a draw
    if (!board.any((row) => row.any((cell) => cell.isEmpty))) {
      showDrawDialog();
    }
  }

  void showWinnerDialog(String player) {
    Get.defaultDialog(
      title: 'Game Over',
      middleText: 'Player $player wins!',
      actions: [
        ElevatedButton(
          onPressed: () {
            resetGame();
            Get.back();
          },
          child: const Text('Play Again'),
        ),
      ],
    );
  }

  void showDrawDialog() {
    Get.defaultDialog(
      title: 'Game Over',
      middleText: 'It\'s a draw!',
      actions: [
        ElevatedButton(
          onPressed: () {
            resetGame();
            Get.back();
          },
          child: const Text('Play Again'),
        ),
      ],
    );
  }

  void resetGame() {
    currentPlayer.value = Player.X;
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board[i].length; j++) {
        board[i][j] = '';
      }
    }
  }

  void togglePlayer() {
    currentPlayer.value = currentPlayer.value == Player.X ? Player.O : Player.X;
  }
}
