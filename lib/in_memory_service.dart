import 'dart:collection';
import 'package:flutter_crud/student.dart';

class StudentService {
  static Map<int, Student> db = LinkedHashMap.identity();

  static bool addStudent(Student student) {
    if(db.containsKey(student.id)) {
      return false;
    }
    db[student.id] = student;
    return true;
  }

  static List<Student> listStudents() {
    return db.values.toList();
  }

  static Student getStudent(int id) {
    return db[id] ?? Student(id: 0);
  }

  static void deleteStudent(int id) {
    db.remove(id);
  }

  static int getCount() {
    return db.length;
  }
}