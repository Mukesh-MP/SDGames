import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/games/memorygame/controller/memory_controller.dart';

class MemoryGamePage extends StatelessWidget {
  final MemoryGameController _memoryController =
      Get.put(MemoryGameController());

  MemoryGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: _memoryController.cardImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _memoryController.flipCard(index),
                  child: Obx(
                    () => Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: _memoryController.matchedCards
                                .contains(_memoryController.cardImages[index])
                            ? Colors.grey
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Visibility(
                          visible: _memoryController.clickedIndex.value ==
                                  index ||
                              _memoryController.clickedIndex2.value == index,
                          child: Text(
                            _memoryController.flippedCards.contains(
                                    _memoryController.cardImages[index])
                                ? _memoryController.cardImages[index]
                                : '',
                            style: const TextStyle(fontSize: 24.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _memoryController.restartGame,
            child: const Text('Restart Game'),
          ),
        ],
      ),
    );
  }
}
