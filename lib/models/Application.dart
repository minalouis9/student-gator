class Application{
  String id, studentUserName, program, school, studentEmail;

  Application(
      {this.id, this.studentUserName, this.program, this.school, this.studentEmail});

  factory Application.fromJson(Map<String, dynamic> json, id) {
    return Application(
        id: id,
        studentUserName: json['studentusername'],
        program: json['program'],
        school: json['school'],
        studentEmail: json['studentemail']);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'studentusername': studentUserName,
      'program': program,
      'school': school,
      'studentemail': studentEmail
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'studentusername': studentUserName,
      'program': program,
      'school': school,
      'studentemail': studentEmail
    };
  }
}