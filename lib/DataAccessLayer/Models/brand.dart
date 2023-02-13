
class Brand {
  final int id;
  final String name;
  final String image;
  Brand ({
    required this.id,
    required this.name,
    required this.image,
  });

  Brand  copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Brand(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}
