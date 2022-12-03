import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message, bool isError) {
  SnackBar snackBar = SnackBar(
    content: Container(
      child: Text(message),
    ),
    shape: RoundedRectangleBorder(),
    backgroundColor: isError ? Colors.red : Colors.green,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void navigate(BuildContext context, Widget destPage) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destPage,
      ));
}

Container getInputContainer(
    String label, TextEditingController controller, String? validationMessage) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
    child: TextFormField(
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 20.0),
          border: OutlineInputBorder(),
          errorStyle: TextStyle(color: Colors.red)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    ),
  );
}
