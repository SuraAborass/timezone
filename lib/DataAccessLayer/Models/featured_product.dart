import 'dart:convert';

class FeaturedProduct {
  final int id;
  final String name;
  final List<String> images;
  final String price;
  final String offer;
  final String brand;
  //final String category;
  final String description;
  FeaturedProduct ({
    required this.id,
    required this.name,
    required this.images,
    required this.brand,
    required this.price,
    required this.offer,
   //required this.category,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image' : images,
      'description' : description,
      'price' : price,
      'offer' : offer,
      'brand' : brand,
      //'category' : category,
    };
  }

  factory FeaturedProduct.fromMap(Map<String, dynamic> map) {
    return FeaturedProduct(
      id: map['id'] as int,
      name: map['name'] as String,
      brand: map['brand'] as String,
     // category: map['category'] as String,
      images: getImages(map['images']) ,
      price: num.parse(map['price'].toString()).toString(),
      offer: num.parse(map['offer'].toString()).toString(),
      description: map['description'] as String,
    );
  }
  static List<String> getImages(List<dynamic> ls){
    List<String> result =[] ;
    for(int i=0;i<ls.length;i++){
      result.add(ls[i].toString());
    }
    return result;
  }
  String toJson() => json.encode(toMap());

  factory FeaturedProduct.fromJson(String source) =>
      FeaturedProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
