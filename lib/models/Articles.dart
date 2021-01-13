// "id": "1",
// "title": "kutykt",
// "content": "<p>kutyk<\/p>",
// "date": "2020-07-23 11:13:15",
// "author":

class Article{
  String id, title, content, date, author;

  Article({this.title, this.content, this.date, this.author, this.id});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json["title"],
        content: json["content"],
        date: json["date"],
        author: json["author"],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "date": date,
      'author': author
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "date": date,
      'author': author
    };
  }
}