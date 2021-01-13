// "Name": "Nancy",
// "Aclow": "300",
// "Achigh": "600",
// "glow": "20",
// "ghigh": "30",
// "grolow": "150",
// "grohigh": "250",
// "outlow": "70",
// "outhigh": "130",
// "trans": "21.5",
// "parag":

class Cities{
  String id, name, acLow, acHigh, gLow, gHigh, groLow, groHigh, outLow, outHigh, trans, parag;

  Cities(
      {this.id, this.name,
      this.acLow,
      this.acHigh,
      this.gLow,
      this.gHigh,
      this.groLow,
      this.groHigh,
      this.outLow,
      this.outHigh,
      this.trans,
      this.parag});

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
        name: json["Name"],
        acLow: json["Aclow"],
        acHigh: json["Achigh"],
        gLow: json["glow"],
        gHigh: json['ghigh'],
        groLow: json["grolow"],
        groHigh: json["grohigh"],
        outLow: json["outlow"],
        outHigh: json["outhigh"],
        trans: json["trans"],
        parag: json["parag"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "Name": name,
      "Aclow": acLow,
      "Achigh": acHigh,
      "glow": gLow,
      'ghigh': gHigh,
      "grolow": groLow,
      "grohigh": groHigh,
      "outlow": outLow,
      "outhigh": outHigh,
      "trans": trans,
      "parag": parag
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "Name": name,
      "Aclow": acLow,
      "Achigh": acHigh,
      "glow": gLow,
      'ghigh': gHigh,
      "grolow": groLow,
      "grohigh": groHigh,
      "outlow": outLow,
      "outhigh": outHigh,
      "trans": trans,
      "parag": parag
    };
  }
}