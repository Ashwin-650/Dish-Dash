import 'package:dish_dash/controllers/myhomepage_controller.dart';
import 'package:dish_dash/screens/main_screens/home_screen.dart';
import 'package:dish_dash/screens/main_screens/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final MyhomepageController controller = Get.put(MyhomepageController());
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomeScreen(), SavedScreen()];

    return Obx(
      () => Scaffold(
        body: IndexedStack(index: controller.pagesIndex.value, children: pages),

        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.brown,
            onTap: (index) {
              controller.pagesIndex.value = index;
            },
            currentIndex: controller.pagesIndex.value,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Saved',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
