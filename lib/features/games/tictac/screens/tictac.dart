import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/games/tictac/controller/tictac_controller.dart';

class TicTac extends StatelessWidget {
  final TicTacController _gameController = Get.put(TicTacController());

  TicTac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final row = index ~/ 3;
                  final col = index % 3;
                  return Obx(() => GestureDetector(
                        onTap: () {
                          _gameController.markCell(row, col);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 65, 57, 62)),
                          ),
                          child: Center(
                            child: Text(
                              _gameController.board[row][col],
                              style: _gameController.board[row][col] == 'X'
                                  ? const TextStyle(
                                      fontSize: 50, color: Colors.red)
                                  : const TextStyle(
                                      fontSize: 50, color: Colors.blue),
                            ),
                          ),
                        ),
                      ));
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _gameController.resetGame();
                },
                child: const Text('Reset Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
