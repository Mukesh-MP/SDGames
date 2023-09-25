import 'package:get/get.dart';
import 'package:sd_games/features/dashboard/dashboard.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () => Get.to(DashBoardScreen()));
    super.onInit();
  }
}
