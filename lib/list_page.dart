import 'package:flutter/material.dart';
import 'package:flutter_crud/add_page.dart';
import 'package:flutter_crud/commons.dart';
import 'package:flutter_crud/in_memory_service.dart';
import 'package:flutter_crud/student.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<TableRow> rows = [];

  _ListPageState() {
    rows = getTableRows();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 5.0, 10.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          4: FixedColumnWidth(110.0),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [getTableHeader(), ...getTableRows()],
      ),
    );
  }

  TableCell getHeaderCell(String cellText) {
    return TableCell(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            cellText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  TableCell getTableCell(String? cellText) {
    return TableCell(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(cellText ?? ''),
        ),
      ),
    );
  }

  TableRow getTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.cyan),
      children: [
        getHeaderCell('Name'),
        getHeaderCell('Brand'),
        getHeaderCell('Price'),
        getHeaderCell('Quantity'),
        getHeaderCell('Action'),
      ],
    );
  }

  List<TableRow> getTableRows() {
    List<TableRow> rows = [];
    StudentService.listStudents().forEach((value) {
      rows.add(getTableRow(value));
    });
    return rows;
  }

  TableRow getTableRow(Student student) {
    return TableRow(
      children: [
        getTableCell(student.name),
        getTableCell(student.age),
        getTableCell(student.course),
        getTableCell(student.gpa),
        TableCell(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        navigate(context, AddPage(student: student));
                      },
                      icon: Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: () {
                        StudentService.deleteStudent(student.id);
                        setState(() {
                          rows = getTableRows();
                        });
                        showMessage(context, "Deleted successfully", false);
                      },
                      icon: Icon(Icons.delete_forever)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
