class Product {
  double? calories;
  double? carbohydrates;
  double? fat;
  String? name;
  double? proteins;

  Product(
      {this.calories, this.name, this.carbohydrates, this.fat, this.proteins});

  // receiving data from server
  Product.fromJson(Map<String, Object?> json)
      : this(
            calories: json['calories'] as double,
            carbohydrates: json['carbohydrates'] as double,
            fat: json['fat'] as double,
            name: json['name'] as String,
            proteins: json['proteins'] as double);

  // sending data to our server
  Map<String, Object?> toJson() {
    return {
      'calories': calories,
      'carbohydrates': carbohydrates,
      'fat': fat,
      'name': name,
      'proteins': proteins,
    };
  }
}
