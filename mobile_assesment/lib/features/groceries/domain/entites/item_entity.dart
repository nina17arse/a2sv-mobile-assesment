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
    required this.isFavourited,
  });

  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<optionsEntity> options;
  final bool isFavourited;

  @override
  List<Object> get props => [id, title, imageUrl, rating, price, discount, description, options, isFavourited];
}

class optionsEntity extends Equatable {
  const optionsEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.isChecked,
  });

  final String id;
  final String name;
  final double price;
  final bool isChecked;

  @override
  List<Object> get props => [id, name, price];

  factory optionsEntity.fromJson(Map<String, dynamic> json) {
    return optionsEntity(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      isChecked: json['isChecked']?? false,
    );
  }
}