import 'dart:math';

import 'package:flutter/material.dart';

import '../styles/icon_broken.dart';


class BezierContainer extends StatelessWidget {
  const BezierContainer({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
          angle: -pi / 3.5,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height *.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xfffbb448),Color(0xffe46b10)]
                  )
              ),
            ),
          ),
        )
    );
  }
}

class ClipPainter extends CustomClipper<Path>{
  @override

  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height );
    path.lineTo(size.width , height);
    path.lineTo(size.width , 0);

    /// [Top Left corner]
    var secondControlPoint =  Offset(0  ,0);
    var secondEndPoint = Offset(width * .2  , height *.3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);



    /// [Left Middle]
    var fifthControlPoint =  Offset(width * .3  ,height * .5);
    var fiftEndPoint = Offset(  width * .23, height *.6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy, fiftEndPoint.dx, fiftEndPoint.dy);


    /// [Bottom Left corner]
    var thirdControlPoint =  Offset(0  ,height);
    var thirdEndPoint = Offset(width , height  );
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);



    path.lineTo(0, size.height  );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

 class MenuDrawer extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          ListTile(
            leading: Icon(
                IconBroken.User
            ),
            title: Text(
                'users'
            ),
            onTap:() => {
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=> UsersScreen() )),
            } ,
          ),

          ListTile(
            leading: Icon(
                IconBroken.Location
            ),
            title: Text(
                'Map'
            ),
            onTap:() => {
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MapScreen() )),
            } ,
          ),

          ListTile(
            leading: Icon(
              IconBroken.Home,
            ),
            title: Text(
                'Chat'
            ),
            onTap:() => {
              //Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen() )),
            } ,
          ),
        ],

      ),

    );

  }

}
