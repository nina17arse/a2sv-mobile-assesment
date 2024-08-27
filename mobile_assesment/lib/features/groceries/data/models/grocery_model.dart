import 'package:mobile_assesment/features/groceries/domain/entites/item_entity.dart';

class GroceryModel extends ItemEntity{
  GroceryModel({
    required String id,
    required String title,
    required String imageUrl,
    required double rating,
    required double price,
    required double discount,
    required String description,
    required List<optionsEntity> options,
  }) : super(
    id: id,
    title: title,
    imageUrl: imageUrl,
    rating: rating,
    price: price,
    discount: discount,
    description: description,
    options: options,
  );

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      description: json['description'],
      options: (json['options'] as List).map((e) => optionsEntity.fromJson(e)).toList(),
    );
  }

}