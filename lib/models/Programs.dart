// "Name": "Bachelor of Computer Sciences",
// "Language": "English",
// "type": "Computer Science & IT",
// "city": "Paris",
// "level": "Bachelor",
// "length": "3 years",
// "fee": "9,900",
// "intake": "Sept",
// "school": "EPITA"

class Programs{
  String id, name, language, type, city, level, length, intake, school;
  int fee;

  Programs(
      {this.id,
      this.name,
      this.language,
      this.type,
      this.city,
      this.level,
      this.length,
      this.fee,
      this.intake,
      this.school});

  factory Programs.fromJson(Map<String, dynamic> json) {
    return Programs(
        name: json["Name"],
        language: json["Language"],
        type: json["type"],
        city: json["city"],
        level: json['level'],
        length: json["length"],
        fee: json['fee'],
        intake: json["intake"],
        school: json["school"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "Name": name,
      "Language": language,
      "type": type,
      "city": city,
      'level': level,
      "length": length,
      "fee": fee,
      "intake": intake,
      "school": school
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "Name": name,
      "Language": language,
      "type": type,
      "city": city,
      'level': level,
      "length": length,
      "fee": fee,
      "intake": intake,
      "school": school
    };
  }
}