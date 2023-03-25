import 'package:timezone/DataAccessLayer/Models/product.dart';

class CartProduct {
  int productId;
  num qty;
  Product? product;
  CartProduct({
    required this.productId,
    required this.qty,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'qty': qty,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      productId: map['productId'] as int,
      qty: map['qty'] as num,
    );
  }
}
