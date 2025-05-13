import 'dart:convert';

import 'package:dish_dash/controllers/home_screen_controller.dart';
import 'package:dish_dash/models/selected_category_model.dart';
import 'package:dish_dash/utils/api_services.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final HomeScreenController controller = Get.find();
  var mealList = <SelectedCategoryModel>[].obs;
  RxString selectedMeal = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCat();
  }

  Future<void> fetchCat() async {
    final response = await ApiServices.specifcCategory(
      data: controller.selectedCat.value,
    );
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final data = jsonDecode(response.body);
      final body = data['meals'] as List;
      mealList.value =
          body.map((e) => SelectedCategoryModel.fromJson(e)).toList();
    }
  }
}
