import 'package:dish_dash/controllers/home_screen_controller.dart';
import 'package:dish_dash/helpers/extentions/text_extention.dart';
import 'package:dish_dash/screens/sub_screens/categories_page.dart';
import 'package:dish_dash/screens/sub_screens/search_screen.dart';
import 'package:dish_dash/widgets/custom_container.dart';
import 'package:dish_dash/widgets/gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.brown,
        title: CustomContainer(
          height: 70,
          isAsset: false,
          image: 'assets/header.png',
          boxFit: BoxFit.contain,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SearchScreen());
            },
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 26,
          ),
        ],
      ),
      body: CustomContainer(
        padding: EdgeInsets.all(10),
        isAsset: false,
        image: 'assets/iPhone 16 Pro - 4 (1).png',
        boxFit: BoxFit.fill,
        widget: Column(
          children: [
            Expanded(
              child: Obx(
                () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9 / 9,
                  ),

                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetectorWidget(
                      onTap: () {
                        controller.selectedCat.value =
                            controller.categoryList[index].strCategory;
                        Get.to(() => CategoriesPage());
                      },
                      widget: CustomContainer(
                        widget: controller.categoryList[index].strCategory
                            .extentext(
                              fontSize: 18,
                              fontweight: FontWeight.bold,
                            ),

                        height: 300,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        image: controller.categoryList[index].strCategoryThumb,
                        boxFit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
