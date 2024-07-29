import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Todays extends StatelessWidget {
  const Todays(
      {super.key, required this.data, required this.image, required this.time});
  final data;
  final image;
  final time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            width: double.infinity,
            height: 131,
            color: Color.fromARGB(255, 230, 219, 229),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  width: 100,
                  height: 82,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 292,
                        height: 94,
                        child: Column(
                          children: [
                            ReadMoreText(
                              data,
                              trimLines: 2,
                              trimExpandedText: "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                              trimMode: TrimMode.Line,
                              moreStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        child: Text(
                          time,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
