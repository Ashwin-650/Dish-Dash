import 'package:dish_dash/controllers/categories_controller.dart';
import 'package:dish_dash/controllers/search_screen_controller.dart';
import 'package:dish_dash/helpers/extentions/text_extention.dart';
import 'package:dish_dash/screens/sub_screens/details_page.dart';
import 'package:dish_dash/widgets/custom_container.dart';
import 'package:dish_dash/widgets/gesture_detector_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchScreenController screenController = Get.put(
      SearchScreenController(),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: Colors.brown.shade300,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextField(
              onChanged: (value) => screenController.textInField.value = value,
              controller: screenController.controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.brown.shade100,
                filled: true,
                hintText: 'Search your Dish....',

                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemCount: screenController.meals.length,
                  itemBuilder: (context, index) {
                    return GestureDetectorWidget(
                      onTap: () {
                        final CategoriesController controller = Get.put(
                          CategoriesController(),
                        );
                        controller.selectedMeal.value =
                            screenController.meals[index].idMeal;
                        Get.to(() => DetailsPage());
                      },
                      widget: ListTile(
                        minTileHeight: 80,
                        leading: CustomContainer(
                          width: 80,
                          height: 90,
                          image: screenController.meals[index].strMealThumb,
                          boxFit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: screenController.meals[index].strMeal.extentext(
                          fontSize: 20,
                          fontweight: FontWeight.w400,
                        ),
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
