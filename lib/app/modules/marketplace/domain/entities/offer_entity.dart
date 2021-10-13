import 'dart:convert';

class OfferEntity {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  OfferEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  OfferEntity copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrl,
  }) {
    return OfferEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory OfferEntity.fromMap(Map<String, dynamic> map) {
    return OfferEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferEntity.fromJson(String source) => OfferEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OfferEntity(id: $id, name: $name, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OfferEntity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ imageUrl.hashCode;
  }
}
