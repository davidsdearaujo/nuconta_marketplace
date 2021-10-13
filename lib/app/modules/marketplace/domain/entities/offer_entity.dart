import 'package:nuconta_marketplace/app/modules/core/core_module.dart';

class OfferEntity {
  final String id;
  final String name;
  final MoneyType price;
  final String description;
  final String imageUrl;
  const OfferEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  OfferEntity copyWith({
    String? id,
    String? name,
    MoneyType? price,
    String? description,
    String? imageUrl,
  }) {
    return OfferEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'OfferEntity(id: $id, name: $name, price: $price, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OfferEntity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ description.hashCode ^ imageUrl.hashCode;
  }
}
