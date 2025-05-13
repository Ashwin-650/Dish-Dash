import 'package:dish_dash/controllers/splash_controller.dart';
import 'package:dish_dash/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: CustomContainer(
        isAsset: false,
        image: 'assets/splash.png',
        boxFit: BoxFit.fill,
      ),
    );
  }
}
