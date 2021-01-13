// "name": "ICN",
// "descr": "Since 1905, ICN has been the leading management school in Eastern France, in the heart of Europe. Its identity and development are based on the links that unite, in today's and tomorrow's economy, management, technology and art. ICN Business School's mission is to provide innovative and transdisciplinary training that enables students in initial and continuing education to become responsible professionals capable of acting in a globalized economic environment.\n\nTranslated with www.DeepL.com\/Translator (free version)",
// "rangep": "47.000 \u20ac - 50.000 \u20ac",
// "alumni": " + 15 000",
// "nostu": "3,000",
// "nointrstu": "38%",
// "rank1": "69",
// "rank2": "15",
// "rank3": "13"

class Schools{
  String id, name, description, rangeP, alumni, nostu, nointrstu, rank1, rank2, rank3;

  Schools(
      {this.id,
      this.name,
      this.description,
      this.rangeP,
      this.alumni,
      this.nostu,
      this.nointrstu,
      this.rank1,
      this.rank2,
      this.rank3});

  factory Schools.fromJson(Map<String, dynamic> json) {
    return Schools(
        name: json["name"],
        description: json["descr"],
        rangeP: json["rangep"],
        alumni: json["alumni"],
        nostu: json['nostu'],
        nointrstu: json["nointrstu"],
        rank1: json["rank1"],
        rank2: json["rank2"],
        rank3: json["rank3"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "descr": description,
      "rangep": rangeP,
      "alumni": alumni,
      'nostu': nostu,
      "nointrstu": nointrstu,
      "rank1": rank1,
      "rank2": rank2,
      "rank3": rank3
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "descr": description,
      "rangep": rangeP,
      "alumni": alumni,
      'nostu': nostu,
      "nointrstu": nointrstu,
      "rank1": rank1,
      "rank2": rank2,
      "rank3": rank3
    };
  }
}