import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:timezone/DataAccessLayer/Models/cart_product.dart';

import '../Models/user.dart';

class BoxClient {
  var box = GetStorage();
  Future<bool> getAuthState() async {
    print(box.read('authed'));
    if (await box.read('authed') != null) {
      return true;
    }
    return false;
  }

  Future<User> getAuthedUser() async {
    print(await box.read('userdata'));
    return User.fromBoxMap(await box.read('userdata'));
  }

  Future<void> setAuthedUser(User user) async {
    await box.write('authed', true);
    await box.write('userdata', user.toMap());
  }

  Future<void> removeUserData() async {
    await box.remove('authed');
    await box.remove('userdata');
  }

  Future<List<CartProdcut>> getCartItems() async {
    var cartItems = await box.read('cart_items');
    if (cartItems != null) {
      final data =
          json.decode(jsonEncode(cartItems)).cast<Map<String, dynamic>>();
      return data
          .map<CartProdcut>((json) => CartProdcut.fromMap(json))
          .toList();
    }

    return [];
  }

  Future<void> AddToCart(List<CartProdcut> cartproducts) async {
    await box.remove('cart_items');
    var map = cartproducts.map((e) => e.toMap());
    await box.write('cart_items', map.toList());
  }
}
