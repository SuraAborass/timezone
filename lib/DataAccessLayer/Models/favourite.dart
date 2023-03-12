// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:timezone/DataAccessLayer/Models/product.dart';

class Favourite {
  final int productId;
  Product? product;
  Favourite({
    required this.productId,
  });

  Favourite copyWith({
    int? id,
    int? productId,
    Product? product,
  }) {
    return Favourite(
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
    };
  }

  factory Favourite.fromMap(Map<String, dynamic> map) {
    return Favourite(
      productId: map['productId'] as int,
    );
  }
}
