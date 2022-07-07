
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  
class Customshape extends CustomClipper<Path>{
  @override
 Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    final firstControlPoint = Offset(0, size.height - 80);
    final firstEndPoint = Offset(size.width / 2, size.height - 60);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    
    // Make your secondControlPoint start with firstEndPoint.dy
    final secondControlPoint = Offset(size.width, firstEndPoint.dy);
    final secondEndPoint = Offset(size.width, size.height / 1.8);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}

