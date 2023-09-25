import 'package:get/get.dart';

class TapController extends GetxController {
  RxInt score = 0.obs;
  RxBool isGameStarted = false.obs;
  RxInt seconds = 10.obs;

  void startGame() {
    score.value = 0;
    isGameStarted.value = true;
    seconds.value = 10;
    countdownTimer();
  }

  void countdownTimer() {
    if (seconds.value > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        seconds.value--;
        countdownTimer();
      });
    } else {
      isGameStarted.value = false;
    }
  }

  void incrementScore() {
    if (isGameStarted.value) {
      score.value++;
    }
  }
}
