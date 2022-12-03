import 'package:flutter/material.dart';
import 'package:flutter_crud/commons.dart';
import 'package:flutter_crud/home_page.dart';
import 'package:flutter_crud/in_memory_service.dart';
import 'package:flutter_crud/student.dart';

class AddPage extends StatefulWidget {
  final Student? student;

  AddPage({this.student});

  @override
  State<AddPage> createState() => _AddPageState(student: student);
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final courseController = TextEditingController();
  final gpaController = TextEditingController();
  Student? student;
  bool isNew = true;

  _AddPageState({this.student}) {
    isNew = student == null || student!.id == 0;
    if (isNew) {
      int studentId = StudentService.db.length + 1;
      student = Student(id: studentId);
    }
    nameController.text = student!.name ?? '';
    ageController.text = student!.age ?? '';
    courseController.text = student!.course ?? '';
    gpaController.text = student!.gpa ?? '';
  }

  @override
  void dispose() {
    gpaController.dispose();
    nameController.dispose();
    ageController.dispose();
    courseController.dispose();
    super.dispose();
  }

  clearText() {
    gpaController.clear();
    nameController.clear();
    ageController.clear();
    courseController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, onPressedNavBtn, "Home"),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              getInputContainer("Name", nameController, "Please enter name"),
              getInputContainer("Age", ageController, "Please enter age"),
              getInputContainer("Course Name", courseController, "Please enter course name"),
              getInputContainer("GPA", gpaController, "Please enter GPA"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: onSubmit,
                        child: Text(isNew ? 'Submit' : 'Update')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      student!.id = isNew ? StudentService.getCount() + 1 : student!.id;
      student!.name = nameController.text;
      student!.course = courseController.text;
      student!.gpa = gpaController.text;
      student!.age = ageController.text;
      StudentService.addStudent(student!.clone());
      showMessage(context, 'Successfully saved', false);
    }
  }

  void onPressedNavBtn() {
    navigate(context, HomePage());
  }
}
