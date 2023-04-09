import 'dart:convert';


class Product {
  final int id;
  final String name;
  final String price;
  final String offer;
  final String description;
  final String brand;
  final String movement;
  final String case_size;
  final String case_material;
  final List<String> images;
  final String category;
  final String reference_number;
  final String gender;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.offer,
    required this.description,
    required this.brand,
    required this.movement,
    required this.case_size,
    required this.case_material,
    required this.images,
    required this.category,
    required this.reference_number,
    required this.gender
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
      'reference_number' : reference_number,
      'movement' : movement,
      'case_size' : case_size,
      'case_material' : case_material,
      'category' : category,
      'gender' : gender
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      name: map['name'] ?? "" ,
      price: map['price'].toString(),
      offer: map['offer'].toString(),
      gender: map['gender'].toString(),
      reference_number: map['reference_number'] !=null? map['reference_number'].toString() : "",
      movement : map['movement'] !=null?map['movement']  :"",
      case_material : map['case_material'] !=null? map['case_material']  : "",
      case_size : map['case_size'] !=null? map['case_size']:"",
      description:  map['description'] ?? "",
      brand:  map['brand']?? "" ,
      images: getImages(map['images']) ,
      category:map['category']!=null? map['category']  : "",
    );
  }

  static List<String> getImages(List<dynamic> ls){
    List<String> result =[] ;
    for(int i=0;i<ls.length;i++){
      result.add(ls[i].toString());
    }
    return result;
  }
  // static List<ProductColor> colorsfromJson(String json) {
  //   final parsed = jsonDecode(jsonEncode(json)).cast<Map<String, dynamic>>();
  //   return parsed.map<ProductColor>((json) => ProductColor.fromMap(json)).toList();
  // }

  String toJson() => json.encode(toMap());
  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
