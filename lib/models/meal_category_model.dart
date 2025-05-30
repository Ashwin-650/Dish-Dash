class MealCategoryModel {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  MealCategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory MealCategoryModel.fromJson(Map<String, dynamic> json) {
    return MealCategoryModel(
      idCategory: json['idCategory'] as String,
      strCategory: json['strCategory'] as String,
      strCategoryThumb: json['strCategoryThumb'] as String,
      strCategoryDescription: json['strCategoryDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCategory': idCategory,
      'strCategory': strCategory,
      'strCategoryThumb': strCategoryThumb,
      'strCategoryDescription': strCategoryDescription,
    };
  }
}
