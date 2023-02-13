import 'dart:convert';
import '../Clients/category_client.dart';
import '../Models/category.dart';


class CategoriesRepo {
  CategoriesClient client = CategoriesClient();
  Future<List<Category>> myCategories() async {
    var response = await client.getCategories();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Category>((json) => Category.fromMap(json))
          .toList();

      // final parsed = json.decode(response.body) as List<Map<String, dynamic>>;
      // return parsed.map((json) => Category.fromMap(json)).toList();
    }
    return [];
  }
}
