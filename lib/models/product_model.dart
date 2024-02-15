import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'].toString(),
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel(
        rate: (jsonData['rating']['rate'] as num).toDouble(),
        count: jsonData['rating']['count'],
      ),
    );
  }
}
