import 'dart:convert';

import 'package:dio/dio.dart';

class StudentData {
  final int id, score;
  final String firsrName, lastName, course, createdAt, updatedAt;

  StudentData(
    this.id,
    this.score,
    this.firsrName,
    this.lastName,
    this.course,
    this.createdAt,
    this.updatedAt,
  );

  StudentData.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        firsrName = res['first_name'],
        lastName = res['last_name'],
        course = res['course'],
        score = res['score'],
        createdAt = res['created_at'],
        updatedAt = res['updated_at'];
}

class HttpClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://alikazemidev.github.io/fake_json_student/',
    ),
  );
}

Future<List<StudentData>> getStudents() async {
  var response = await HttpClient.dio.get('student.json');
  List<StudentData> students = [];
  if (response.data is List<dynamic>) {
    (response.data as List<dynamic>).forEach((element) {
      students.add(
        StudentData.fromJson(element),
      );
    });
  }

  return students;
}
