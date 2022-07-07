import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/modules/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';



class Splash2 extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return Center(
	  child: SplashScreen(
    gradientBackground: LinearGradient(
                      //  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 174, 217, 255)],
                      //  colors: [Color.fromARGB(255, 96, 165, 239), Color.fromARGB(255, 153, 204, 250)], // mahmoud
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
	  seconds: 4,
	  navigateAfterSeconds: new SecondScreen(),
	  title: new Text('Achelois',textScaleFactor: 2,),

	  image: Image.asset('assets/logo2.png',fit: BoxFit.fill),
	  photoSize: 100.0,
          loadingText: Text("We care about your health"),
      loaderColor: Color.fromARGB(255, 227, 245, 255)
  // useLoader: false,
  // loaderColor: Color.fromARGB(146, 147, 226, 255),
	  // loaderColor: Color.fromARGB(255, 14, 37, 55),
	  ),
	);
}
}
// class SecondScreen extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return LoginScreen();
// }
// }



class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  var user;
  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   
setState(() {
        user = prefs.getString('email');}
        );

        print('--------------------');
        print(user);
        }
Future<void> parameter_ () async {
  try {
     {
      await Future.delayed(const Duration(milliseconds: 50), (){
        getPref();
        
      });
         }}
         
   catch (e) {       
          print('parameter_ has failed' + e.toString());
          }
       }

    @override
  void initState() {
    parameter_();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();}



  @override
  Widget build(BuildContext context) {
    // return user == null ? LoginScreen() : Home();
    return LoginScreen() ;
    
    
  }
}