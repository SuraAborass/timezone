import 'dart:convert';


class Data {
  final String type;
  final String additional;


  Data({
    required this.type,
    required this.additional,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'additional': additional,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
        type: map['type'] as String,
        additional: map['additional'] as String
        );
  }


  String toJson() => json.encode(toMap());
  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);
}