import 'dart:convert';
import '../Clients/favourite_client.dart';
import '../Models/favourite.dart';



class FavouriteRepo{
  var client = FavouriteClient();
  Future<List<Favourite>> getUserFavourites(userId) async {
    var response = await client.getFavourites(userId);
    if (response.isNotEmpty) {
      final myFavourites = json.decode(response).cast<Map<String, dynamic>>();
      return myFavourites
          .map<Favourite>((json) => Favourite.fromJson(json))
          .toList();
    }
    return [];
  }
}