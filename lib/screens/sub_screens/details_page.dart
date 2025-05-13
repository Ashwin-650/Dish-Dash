import 'package:dish_dash/controllers/details_page_controller.dart';
import 'package:dish_dash/helpers/extentions/text_extention.dart';
import 'package:dish_dash/widgets/custom_container.dart';
import 'package:dish_dash/widgets/ingredient_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final DetailsPageController controller = Get.put(DetailsPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hasData = controller.details.value != null;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title:
              hasData
                  ? controller.details.value!.strMeal?.extentext(
                    fontweight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 26,
                  )
                  : 'Recipe Details'.extentext(
                    color: Colors.white,
                    fontweight: FontWeight.bold,

                    fontSize: 26,
                  ),
        ),
        body:
            !hasData
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomContainer(
                        height: 200,
                        width: double.infinity,
                        image: controller.details.value!.strMealThumb,
                        boxFit: BoxFit.cover,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                'Dish Type'.extentext(
                                  fontSize: 20,
                                  fontweight: FontWeight.bold,
                                ),
                                TextButton.icon(
                                  onPressed:
                                      () => controller.goToUrl(
                                        controller.details.value!.strYoutube
                                            .toString(),
                                      ),
                                  label: 'Watch on YouTube'.extentext(
                                    fontweight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  icon: Icon(
                                    Icons.ondemand_video,
                                    color: Colors.white,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.red.shade800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            CustomContainer(
                              widget:
                                  '${controller.details.value!.strArea ?? 'Unknown'} '
                                      .extentext(),
                            ),
                            const SizedBox(height: 16),
                            'Cooking Instructions'.extentext(
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                            const SizedBox(height: 8),
                            CustomContainer(
                              widget:
                                  (controller.details.value!.strInstructions ??
                                          'No instructions available')
                                      .extentext(),
                            ),
                            const SizedBox(height: 16),
                            'Ingredients Needed'.extentext(
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                            const SizedBox(height: 8),
                            IngredientWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      );
    });
  }
}
