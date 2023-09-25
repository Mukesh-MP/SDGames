import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sd_games/features/games/tap/controller/tap_controller.dart';

class TapTheButtonPage extends StatelessWidget {
  final TapController _tapController = Get.put(TapController());

  TapTheButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap the Button Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text(
                  'Tap the button as many times as you can in ${_tapController.seconds.value} seconds!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0),
                )),
            const SizedBox(height: 20.0),
            Obx(() => Text(
                  'Score: ${_tapController.score.value}',
                  style: const TextStyle(fontSize: 40.0),
                )),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _tapController.isGameStarted.value
                  ? _tapController.incrementScore
                  : _tapController.startGame,
              child: Obx(() => Text(
                    _tapController.isGameStarted.value
                        ? 'Tap Me!'
                        : 'Start Game',
                    style: const TextStyle(fontSize: 20.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
