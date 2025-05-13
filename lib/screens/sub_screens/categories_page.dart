import 'package:dish_dash/controllers/categories_controller.dart';
import 'package:dish_dash/controllers/home_screen_controller.dart';
import 'package:dish_dash/helpers/extentions/text_extention.dart';
import 'package:dish_dash/screens/sub_screens/details_page.dart';
import 'package:dish_dash/widgets/custom_container.dart';
import 'package:dish_dash/widgets/gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  final CategoriesController controller = Get.put(CategoriesController());
  final HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: homeScreenController.selectedCat.value.extentext(
          fontSize: 26,
          fontweight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: CustomContainer(
        isAsset: false,
        image: 'assets/iPhone 16 Pro - 4 (1).png',
        boxFit: BoxFit.fill,
        padding: EdgeInsets.all(10),
        widget: Column(
          children: [
            Expanded(
              child: Obx(
                () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 12,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.mealList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetectorWidget(
                      onTap: () {
                        controller.selectedMeal.value =
                            controller.mealList[index].idMeal;
                        Get.to(() => DetailsPage());
                      },
                      widget: CustomContainer(
                        widget: controller.mealList[index].strMeal.extentext(
                          fontSize: 18,
                          fontweight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          color: Colors.white,
                          isShadow: true,
                        ),
                        height: 200,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        image: controller.mealList[index].strMealThumb,
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
