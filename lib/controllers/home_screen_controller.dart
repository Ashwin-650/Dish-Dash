import 'dart:convert';

import 'package:dish_dash/models/meal_category_model.dart';
import 'package:dish_dash/utils/api_services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var categoryList = <MealCategoryModel>[].obs;
  RxString selectedCat = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    final response = await ApiServices.mealsCategory();
    if (response != null && (response.statusCode == 200)) {
      final data = jsonDecode(response.body);
      final body = data["categories"] as List;
      categoryList.value =
          body.map((e) => MealCategoryModel.fromJson(e)).toList();
      Get.showSnackbar(
        GetSnackBar(message: 'Welcome', duration: Duration(seconds: 2)),
      );
    } else {
      Get.showSnackbar(
        GetSnackBar(message: 'fail', duration: Duration(seconds: 3)),
      );
    }
  }
}
