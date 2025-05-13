import 'dart:convert';

import 'package:dish_dash/controllers/categories_controller.dart';
import 'package:dish_dash/models/meal_details_model.dart';
import 'package:dish_dash/utils/api_services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPageController extends GetxController {
  final CategoriesController controller = Get.find();

  Rx<MealDetailsModel?> details = Rxn<MealDetailsModel>();

  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }

  Future<void> fetchDetails() async {
    final response = await ApiServices.productDetails(
      id: controller.selectedMeal.value,
    );
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final data = jsonDecode(response.body);
      final body = data["meals"] as List;
      details.value = MealDetailsModel.fromJson(body.first);
    }
  }

  Future<void> goToUrl(String parUrl) async {
    final url = Uri.parse(parUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.showSnackbar(
        GetSnackBar(message: 'No url', duration: Duration(seconds: 3)),
      );
    }
  }
}
