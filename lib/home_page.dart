import 'package:flutter/material.dart';
import 'package:flutter_crud/add_page.dart';
import 'package:flutter_crud/commons.dart';
import 'package:flutter_crud/list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePaState();
}

class _HomePaState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, onPressed, "Add"),
      body: ListPage(),
    );
  }

  onPressed() {
    navigate(context, AddPage());
  }
}

AppBar buildAppBar(
    BuildContext context, Function()? callback, String buttonTxt) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Flutter CRUD"),
        ElevatedButton(
            onPressed: callback,
            child: Text(buttonTxt),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrange)
          ),
        ),
      ],
    ),
  );
}
