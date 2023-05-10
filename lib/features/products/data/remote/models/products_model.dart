class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  final double price;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: int.parse(json["id"].toString()),
      title: json["title"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: Rating.fromJson(json["rating"]),
      price: double.parse(json["price"].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating,
      "price": price,
    };
  }
}

class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: double.parse(json["rate"].toString()),
      count: int.parse(json["count"].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rate": rate,
      "count": count,
    };
  }
//
}
