// "level": "PhD"

class Level{
  String id, level;

  Level({this.id, this.level});

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
        level: json['level']);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'level': level
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'level': level
    };
  }
}