import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:timezone/DataAccessLayer/Models/cart_product.dart';
import 'package:timezone/DataAccessLayer/Models/favourite.dart';

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

  Future<void> saveUserMail(email) async {
    await box.remove('tz_user_mail');
    await box.write('tz_user_mail', email);
  }

  Future<String> getSavedMail() async {
    return await box.read('tz_user_mail');
  }

  Future<List<CartProduct>> getCartItems() async {
    var cartItems = await box.read('cart_items');
    if (cartItems != null) {
      final data =
          json.decode(jsonEncode(cartItems)).cast<Map<String, dynamic>>();
      return data
          .map<CartProduct>((json) => CartProduct.fromMap(json))
          .toList();
    }
    return [];
  }

  Future<void> AddToCart(List<CartProduct> cartProducts) async {
    await box.remove('cart_items');
    var map = cartProducts.map((e) => e.toMap());
    await box.write('cart_items', map.toList());
  }

  Future<List<Favourite>> getFavorites() async {
    var favoriteItems = await box.read('favorites');
    if (favoriteItems != null) {
      final data =
          json.decode(jsonEncode(favoriteItems)).cast<Map<String, dynamic>>();
      return data.map<Favourite>((json) => Favourite.fromMap(json)).toList();
    }

    return [];
  }

  Future<void> AddToFavorite(List<Favourite> cartProducts) async {
    await box.remove('favorites');
    var map = cartProducts.map((e) => e.toMap());
    await box.write('favorites', map.toList());
  }
}
