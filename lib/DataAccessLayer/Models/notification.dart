

class UserNotification {
  final int id;
  final String title;
  final String subtitle;
  final dynamic data;
  final String type;
  final String time;


  UserNotification({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.data,
    required this.type,
    required this.time,
  });



  factory UserNotification.fromMap(Map<String, dynamic> map) {
    return UserNotification(
      id: map['id'] as int,
      title: map['title'] as String,
        subtitle: map['subtitle'] as String,
      data: map['data'],
        type: map['type'],
      time:  map['time'] as String
    );
  }



}