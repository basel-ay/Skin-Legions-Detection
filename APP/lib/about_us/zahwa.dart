import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/about_us/About.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Zahwa extends StatefulWidget {
  const Zahwa({Key? key}) : super(key: key);

  @override
  State<Zahwa> createState() => _ZahwaState();
}

class _ZahwaState extends State<Zahwa> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        // title: Text('augustus'),
        leading: IconButton(
            onPressed: (){
                Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => About()),);
            
       
            }, icon: Icon(Icons.arrow_back_outlined)
            ),
        
         actions: [
           IconButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);           
                }, icon: Icon(Icons.home_sharp)),
            
        ],
        flexibleSpace: Expanded(
          child: Container(
            padding:EdgeInsets.only(top:35),
            child: Text('Zahwa Khaled',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
            alignment:Alignment.center,
              decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.black, Colors.blue ]),
              ),
            ),
        ),
  ),


  body: Center(
    child : WebviewScaffold(
      url: "https://www.linkedin.com/in/zahwa-khaled-0a648a234/",
      withZoom: true,
      withLocalStorage: true,
     )
   ),

    
    );
  }
}