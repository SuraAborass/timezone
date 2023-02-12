import 'dart:convert';
import 'color.dart';


class Product {
  final int id;
  final String name;
  final String price;
  final String offer;
  final String description;
  final String brand;
  final List<String> images;
  final String category;
  //final Category category;
  final List<ProductColor>? colors;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.offer,
    required this.description,
    required this.brand,
    required this.images,
    required this.category,
    this.colors,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name' : name,
      'price' : price,
      'offer' : offer,
      'description': description,
      'brand' : brand,
      'images' : images,
      'category' : category,
      'colors' : colors,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'].toString(),
      offer: map['offer'].toString(),
      description: map['description'] as String,
      brand: map['brand'] as String,
      images: getImages(map['images']) ,
      //category: Category.fromMap(map['category']),
      category: map['category'] as String,
      colors: null,
      //map['colors'] !=null ? colorsfromJson(map['colors'].toString()) : ,
    );
  }

  static List<String> getImages(List<dynamic> ls){
    List<String> result =[] ;
    for(int i=0;i<ls.length;i++){
      result.add(ls[i].toString());
    }
    return result;
  }
  static List<ProductColor> colorsfromJson(String json) {
    final parsed = jsonDecode(jsonEncode(json)).cast<Map<String, dynamic>>();
    return parsed.map<ProductColor>((json) => ProductColor.fromMap(json)).toList();
  }

  String toJson() => json.encode(toMap());
  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
