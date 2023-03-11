// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:timezone/DataAccessLayer/Models/product.dart';

class CartProdcut {
  int productId;
  num qty;
  Product? product;
  CartProdcut({
    required this.productId,
    required this.qty,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'qty': qty,
    };
  }

  factory CartProdcut.fromMap(Map<String, dynamic> map) {
    return CartProdcut(
      productId: map['productId'] as int,
      qty: map['qty'] as num,
    );
  }
}
