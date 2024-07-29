import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.purple,
          // color: Color.fromARGB(255, 240, 243, 245),
          border: Border.all(color: Colors.black)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: DataTable(columns: [
            DataColumn(
                label: Text(
              "Name",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
            DataColumn(
                label: Text("Shop Code",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18))),
            DataColumn(
                label: Text("Price",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18))),
            DataColumn(
                label: Text("Start Date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18))),
            DataColumn(
                label: Text("End Date",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)))
          ], rows: [
            DataRow(
                color: MaterialStatePropertyAll(
                    Color.fromARGB(255, 240, 243, 245)),
                cells: [
                  DataCell(Text(
                    "Mocha",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
                  DataCell(Text(
                    "CM1023",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
                  DataCell(Text(
                    "120.0",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
                  DataCell(Text(
                    "01/02/2024",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
                  DataCell(Text(
                    "03/02/2024",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ))
                ])
          ]),
        ),
      ),
    );
  }
}
