import 'dart:convert';
import 'package:timezone/DataAccessLayer/Models/product.dart';


class Favourite {
  final int id;
  final Product product;

  Favourite({
    required this.id,
    required this.product,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id' : id,
      'product': product,
    };
  }

  factory Favourite.fromMap(Map<String, dynamic> map) {
    return Favourite(
        id: map['id'] as int,
        product: Product.fromMap(map['product']),
    );
  }


  String toJson() => json.encode(toMap());
  factory Favourite.fromJson(String source) =>
      Favourite.fromMap(json.decode(source) as Map<String, dynamic>);
}
