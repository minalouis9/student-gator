// "user": "dorian123",
// "ID_TL":

class TaskLink{
  String id, user, iDTL;

  TaskLink({this.id, this.user, this.iDTL});

  factory TaskLink.fromJson(Map<String, dynamic> json) {
    return TaskLink(
      user: json["user"],
    iDTL: json["ID_TL"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "user": user,
      "ID_TL": iDTL
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "user": user,
      "ID_TL": iDTL
    };
  }
}