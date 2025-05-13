class SelectedCategoryModel {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  SelectedCategoryModel({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  factory SelectedCategoryModel.fromJson(Map<String, dynamic> json) {
    return SelectedCategoryModel(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'idMeal': idMeal, 'strMeal': strMeal, 'strMealThumb': strMealThumb};
  }
}
