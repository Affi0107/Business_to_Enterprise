import 'package:flutter/material.dart';

class TagsLabel extends StatelessWidget {
  const TagsLabel({super.key});

  @override
  Widget build(BuildContext context) {
    double fs = 17;
    double tw = 58;
    return Container(
      width: 1012,
      decoration: BoxDecoration(color: Colors.purple),
      height: 50,
      child: Padding(
        padding: EdgeInsets.only(left: 17, right: 4),
        child: Row(
          children: [
            Container(
              width: 120,
              //      color: Colors.green,
              child: Center(
                child: Text(
                  'Published On',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: fs,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: tw,
            ),
            Container(
              width: 80,
              //      color: Colors.green,
              child: Center(
                child: Text(
                  'Zone',
                  style: TextStyle(
                      fontSize: fs,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: tw,
            ),
            Container(
              width: 80,
              //     color: Colors.green,
              child: Center(
                child: Text(
                  'Area',
                  style: TextStyle(
                      fontSize: fs,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 58,
            ),
            Container(
              width: 83,
              //    color: Colors.green,
              child: Center(
                child: Text(
                  'Store ID',
                  style: TextStyle(
                      fontSize: fs,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: tw,
            ),
            Container(
              width: 90,
              //    color: Colors.green,
              child: Center(
                child: Text(
                  'Status',
                  style: TextStyle(
                      fontSize: fs,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: tw,
            ),
            Container(
              width: 110,
              //     color: Colors.green,
              child: Center(
                child: Text(
                  'Activated On',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: fs,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: tw,
            ),
            Container(
              width: 80,
              //      color: Colors.green,
              child: Center(
                child: Text(
                  'Action',
                  style: TextStyle(
                      fontSize: fs,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
