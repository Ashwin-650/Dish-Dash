// meal_details_model.dart

class MealDetailsModel {
  final String? idMeal;
  final String? strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String> ingredients;
  final List<String> measures;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  MealDetailsModel({
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.ingredients,
    required this.measures,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    // Extract ingredients and measures
    for (int i = 1; i <= 20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';

      final ingredient = json[ingredientKey];
      final measure = json[measureKey];

      // Only add non-empty ingredients and their corresponding measures
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredients.add(ingredient.toString());

        if (measure != null && measure.toString().trim().isNotEmpty) {
          measures.add(measure.toString());
        } else {
          measures.add('');
        }
      }
    }

    return MealDetailsModel(
      idMeal: json['idMeal']?.toString(),
      strMeal: json['strMeal']?.toString(),
      strMealAlternate: json['strMealAlternate']?.toString(),
      strCategory: json['strCategory']?.toString(),
      strArea: json['strArea']?.toString(),
      strInstructions: json['strInstructions']?.toString(),
      strMealThumb: json['strMealThumb']?.toString(),
      strTags: json['strTags']?.toString(),
      strYoutube: json['strYoutube']?.toString(),
      ingredients: ingredients,
      measures: measures,
      strSource: json['strSource']?.toString(),
      strImageSource: json['strImageSource']?.toString(),
      strCreativeCommonsConfirmed:
          json['strCreativeCommonsConfirmed']?.toString(),
      dateModified: json['dateModified']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealAlternate': strMealAlternate,
      'strCategory': strCategory,
      'strArea': strArea,
      'strInstructions': strInstructions,
      'strMealThumb': strMealThumb,
      'strTags': strTags,
      'strYoutube': strYoutube,
      'strSource': strSource,
      'strImageSource': strImageSource,
      'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
      'dateModified': dateModified,
    };

    // Add ingredients and measures
    for (int i = 0; i < ingredients.length; i++) {
      json['strIngredient${i + 1}'] = ingredients[i];
      json['strMeasure${i + 1}'] = i < measures.length ? measures[i] : '';
    }

    // Fill remaining ingredient/measure slots with empty strings
    for (int i = ingredients.length + 1; i <= 20; i++) {
      json['strIngredient$i'] = '';
      json['strMeasure$i'] = '';
    }

    return json;
  }

  // Helper method to get paired ingredients and measures
  List<Map<String, String>> getIngredientWithMeasures() {
    List<Map<String, String>> result = [];

    for (int i = 0; i < ingredients.length; i++) {
      if (ingredients[i].trim().isNotEmpty) {
        result.add({
          'ingredient': ingredients[i],
          'measure': i < measures.length ? measures[i] : '',
        });
      }
    }

    return result;
  }
}
