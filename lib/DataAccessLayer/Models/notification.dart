import 'dart:convert';
import 'data.dart';


class UserNotification {
  final int id;
  final String title;
  final String description;
  final Data data;
  final String time;


  UserNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.data,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id' : id,
      'title': title,
      'description': description,
      'time' : time
    };
  }

  factory UserNotification.fromMap(Map<String, dynamic> map) {
    return UserNotification(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      data:  Data.fromMap(map['data']),
      time:  map['time'] as String
    );
  }


  String toJson() => json.encode(toMap());
  factory UserNotification.fromJson(String source) =>
      UserNotification.fromMap(json.decode(source) as Map<String, dynamic>);
}