class CategoryModel {
  final String name;

  const CategoryModel({
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json["name"],
    );
  }
//
}
