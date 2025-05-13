import 'dart:convert';

import 'package:dish_dash/models/meal.dart';
import 'package:dish_dash/utils/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  final TextEditingController controller = TextEditingController();
  RxString textInField = ''.obs;
  @override
  void onInit() {
    super.onInit();

    debounce(textInField, (value) async {
      clean();

      if (value.isEmpty) {
        clean();
      } else if (value.length == 1) {
        searchByFirstLetter(letter: value);
      } else {
        searchByName(name: value);
      }
    }, time: Duration(milliseconds: 500));
  }

  var meals = <Meal>[].obs;

  Future<void> searchByFirstLetter({required String letter}) async {
    final response = await ApiServices.searchMealByLetter(letter: letter);
    if (response != null && response.statusCode == 200) {
      meals.clear();

      final data = jsonDecode(response.body);
      final body = data["meals"] as List;

      meals.value = body.map((e) => Meal.fromJson(e)).toList();
    }
  }

  Future<void> searchByName({required String name}) async {
    final response = await ApiServices.searchMealByName(name: name);
    if (response != null && response.statusCode == 200) {
      meals.clear();

      final data = jsonDecode(response.body);
      final body = data["meals"] as List;

      meals.value = body.map((e) => Meal.fromJson(e)).toList();
    }
  }

  void clean() {
    meals.clear();
    update();
  }
}
