// "type":

class Types{
  String id, type;

  Types({this.id, this.type});

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
        type: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'type': type
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type
    };
  }
}