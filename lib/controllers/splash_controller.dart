import 'package:dish_dash/screens/main_screens/my_home_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    login();
  }

  Future<void> login() async {
    await Future.delayed(Duration(seconds: 3));
    Get.off(() => MyHomePage());
  }
}
