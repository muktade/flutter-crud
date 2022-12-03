class Student {
  int id;
  String? name = '';
  String? age = '';
  String? course = '';
  String? gpa = '';

  Student({required this.id, this.name, this.age, this.course, this.gpa});

  Student clone() {
    return Student(id: id, name: name, age: age, course: course, gpa: gpa);
  }
}