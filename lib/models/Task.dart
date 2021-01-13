// "ID": "16",
// "content": "ftyftufgfu yif-t ",
// "checked": "0",
// "due_date": "Jul 29, 2020",
// "date":

class Task{
  int id;
  String content, checked, dueDate, date;

  Task({this.id, this.content, this.checked, this.dueDate, this.date});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        content: json["content"],
        date: json["date"],
        checked: json['checked'],
        dueDate: json["due_date"],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "checked": checked,
      "content": content,
      "date": date,
      'due_date': dueDate
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "checked": checked,
      "content": content,
      "date": date,
      'due_date': dueDate
    };
  }
}