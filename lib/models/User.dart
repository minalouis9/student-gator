import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String id,
      name,
      bio,
      username,
      password,
      email,
      nationality,
      languageTest,
      countryWanted,
      profilePictureURL;
  bool subAgent;
  int type, appliedPrograms;

  Users(
      {this.id,
      this.name,
      this.bio,
      this.username,
      this.password,
      this.email,
      this.nationality,
      this.languageTest,
      this.countryWanted,
      this.profilePictureURL,
      this.subAgent,
      this.appliedPrograms,
      this.type});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json["_id"],
        name: json["Name"],
        bio: json["bio"],
        username: json["username"],
        password: json["password"],
        email: json['email'],
        nationality: json["nationality"],
        languageTest: json["langtest"],
        countryWanted: json["countrywanted"],
        profilePictureURL: json["profile_picture_url"],
        subAgent: json["subagent"] == null ? false : json["subagent"],
        appliedPrograms:
            json["appliedprograms"] == null ? 0 : json["appliedprograms"],
        type: json["type"]);
  }

  Users.fromSnapshot(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot.id,
        name = documentSnapshot.data()["Name"],
        bio = documentSnapshot.data()["bio"],
        username = documentSnapshot.data()["username"],
        password = documentSnapshot.data()["password"],
        email = documentSnapshot.data()['email'],
        nationality = documentSnapshot.data()["nationality"],
        languageTest = documentSnapshot.data()["langtest"],
        countryWanted = documentSnapshot.data()["countrywanted"],
        profilePictureURL = documentSnapshot.data()["profile_picture_url"],
        subAgent = documentSnapshot.data()["subagent"] == null
            ? false
            : documentSnapshot.data()["subagent"],
        appliedPrograms = documentSnapshot.data()["appliedprograms"] == null
            ? 0
            : documentSnapshot.data()["appliedprograms"],
        type = documentSnapshot.data()["type"];

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "Name": name,
      "bio": bio,
      "username": username,
      "password": password,
      'email': email,
      "nationality": nationality,
      "langtest": languageTest,
      "countrywanted": countryWanted,
      "profile_picture_url": profilePictureURL,
      "subagent": subAgent,
      "appliedprograms": appliedPrograms,
      "type": type
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "Name": name,
      "bio": bio,
      "username": username,
      "password": password,
      'email': email,
      "nationality": nationality,
      "langtest": languageTest,
      "countrywanted": countryWanted,
      "profile_picture_url": profilePictureURL,
      "subagent": subAgent,
      "appliedprograms": appliedPrograms,
      "type": type
    };
  }
}
