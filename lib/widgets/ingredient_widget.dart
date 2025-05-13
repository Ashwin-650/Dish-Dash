import 'package:dish_dash/controllers/details_page_controller.dart';
import 'package:dish_dash/helpers/extentions/text_extention.dart';
import 'package:dish_dash/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientWidget extends StatelessWidget {
  IngredientWidget({super.key});
  final DetailsPageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final meal = controller.details.value!;

    if (meal.ingredients.isEmpty) {
      return CustomContainer(widget: 'No ingredients available'.extentext());
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: meal.ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = meal.ingredients[index];
        final measure =
            index < meal.measures.length ? meal.measures[index] : '';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(child: '$measure $ingredient'.extentext()),
            ],
          ),
        );
      },
    );
  }
}
