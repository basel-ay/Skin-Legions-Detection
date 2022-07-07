import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/about_us/About.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class Nada extends StatefulWidget {
  
  const Nada({Key? key}) : super(key: key);

  @override
  
  State<Nada> createState() 
  => _NadaState();
}


class _NadaState extends 
State<Nada> {
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
            child: Text('Nada Ahmed',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
      url: "https://www.google.com/",
      withZoom: true,
      withLocalStorage: true,
     )
   ),

    
    );
  }
}