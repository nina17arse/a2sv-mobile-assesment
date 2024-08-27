import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  const ItemEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });

  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<optionsEntity> options;

  @override
  List<Object> get props => [id, title, imageUrl, rating, price, discount, description, options];
}

class optionsEntity extends Equatable {
  const optionsEntity({
    required this.id,
    required this.name,
    required this.price,
  });

  final String id;
  final String name;
  final double price;

  @override
  List<Object> get props => [id, name, price];

  factory optionsEntity.fromJson(Map<String, dynamic> json) {
    return optionsEntity(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
}