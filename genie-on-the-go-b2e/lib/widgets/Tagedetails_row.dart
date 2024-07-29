import 'package:flutter/material.dart';

class TagActivated extends StatelessWidget {
  const TagActivated({super.key, this.active = true});
  final active;

  @override
  Widget build(BuildContext context) {
    double tw = 48;
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 2),
      decoration: BoxDecoration(
          color: active == false
              ? Colors.white
              : Color.fromARGB(248, 220, 225, 228)),
      height: 45,
      width: 1015,
      child: Padding(
        padding: EdgeInsets.only(left: 17, right: 4),
        child: Row(
          children: [
            Container(
              //      color: Colors.green,
              width: 120,
              child: Center(
                child: Text(
                  '01/02/2024',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              width: 58,
            ),
            Container(
              width: 80,
              //    color: Colors.green,
              child: Center(
                child: Text(
                  'Zone A',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //    color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 58,
            ),
            Container(
              width: 80,
              //   color: Colors.green,
              child: Center(
                child: Text(
                  'Area 1',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //  color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 58,
            ),
            Container(
              width: 83,
              //   color: Colors.green,
              child: Center(
                child: Text(
                  'CM00A12',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //   color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 58,
            ),
            Container(
              width: 90,
              child: Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                    height: 30,
                    width: 83,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: active == true
                            ? Color.fromARGB(255, 63, 221, 31)
                            : Color.fromARGB(255, 233, 176, 55)),
                    child: Center(
                      child: Text(active == true ? ' Active' : "Not Active",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    )),
              ),
            ),
            SizedBox(
              width: 58,
            ),
            Container(
              width: 110,
              //   color: Colors.green,
              child: Center(
                child: Text(
                  '01/01/2024',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //     color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 58,
            ),
            Container(
              width: 80,
              //   color: Colors.green,
              child: Center(
                child: Text(
                  'Connect',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //  color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
