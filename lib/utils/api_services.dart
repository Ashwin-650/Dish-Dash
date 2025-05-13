import 'package:dish_dash/constants/globals.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const Map<String, String> header = {
    "Content-Type": "Application/json",
  };
  static Future<dynamic> mealsCategory() async {
    try {
      final response = await http.get(
        Uri.parse('${Globals.baseUrl}/categories.php'),

        headers: header,
      );

      return response;
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> specifcCategory({required String data}) async {
    try {
      final response = await http.get(
        Uri.parse('${Globals.baseUrl}/filter.php?c=$data'),
        headers: header,
      );
      return response;
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> productDetails({required String id}) async {
    try {
      final response = await http.get(
        Uri.parse('${Globals.baseUrl}/lookup.php?i=$id'),
        headers: header,
      );
      return response;
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> searchMealByLetter({required String letter}) async {
    try {
      final response = await http.get(
        Uri.parse("${Globals.baseUrl}//search.php?f=$letter"),
        headers: header,
      );
      return response;
    } catch (error) {
      return null;
    }
  }

  static Future<dynamic> searchMealByName({required String name}) async {
    try {
      final response = await http.get(
        Uri.parse("${Globals.baseUrl}/search.php?s=$name"),
        headers: header,
      );
      return response;
    } catch (error) {
      return null;
    }
  }
}
