import 'package:flutter/material.dart';

class OfferTagClipper extends CustomClipper<Path> {
  @override
    Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height );
    path.lineTo(size.width , size.height);
    path.lineTo(0, size.height );
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
