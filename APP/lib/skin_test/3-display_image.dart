import 'package:flutter/material.dart';
import 'package:flutter_application_1/diseases/Vascular%20Lesion.dart';
import 'package:flutter_application_1/diseases/actinic_keratosis.dart';
import 'package:flutter_application_1/diseases/basel.dart';
import 'package:flutter_application_1/diseases/benign_keratosis.dart';
import 'package:flutter_application_1/diseases/cancer.dart';
import 'package:flutter_application_1/diseases/dermatofibroma.dart';
import 'package:flutter_application_1/diseases/melanocytic_nevus.dart';
import 'package:flutter_application_1/diseases/melanoma.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter_application_1/skin_test/2-load_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';





class Display_image extends StatefulWidget {
  const Display_image({ Key? key }) : super(key: key);

  @override
  State<Display_image> createState() => _Display_imageState();
}

class _Display_imageState extends State<Display_image> {
 var label_output ;
 var confidence_output;
 var base64string ;

 var skin_or_not;
 late Uint8List decodedbytes; 
  int augustus = 0;
  int augustus2 = 0;
  int augustus3 = 0;
  var diseases_or_test = '';
  String final_result = 'the best of all';
  String Final_score = '95'; 
  var infotxt;
  List dangerous_lessions = ['Melanoma','Melanocytic Nevus','Basal Cell Carcinoma'];  

  var affected_area ;
  var affected_area_size;
  var duration_injury;
  var itch;
  var fever;
  var affected_area_shape;
  var affected_area_color;
  var tissue_damage;

  var quick_advanced  ; 


getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      label_output = prefs.getString('label_output');
      confidence_output = prefs.getString('confidence_output');
      base64string = prefs.getString('base64string');
      infotxt = prefs.getString('infotxt');
      quick_advanced = prefs.getString('quick_advanced');
      affected_area = prefs.getString('affected_area');
      affected_area_size = prefs.getString('affected_area_size');
      duration_injury = prefs.getString('duration_injury');
      itch = prefs.getString('itch');
      fever = prefs.getString('fever');
      affected_area_shape = prefs.getString('affected_area_shape');
      affected_area_color = prefs.getString('affected_area_color');
      
      



    final_result =  label_output;
    Final_score = confidence_output;
    });
    
    print('get Pref of results page has been done');
  }



 savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();             
    setState(() {
      prefs.setString('diseases_or_test', diseases_or_test);       
    });
    
    print('save prefs diseases_or_test save as test done successfllly');
  } 

@override
void initState() {
  getPref() ;
  convert_image();
  super.initState();

   
}

void convert_image (){
  try {
     {
      Timer(Duration(milliseconds: 1), () {
               setState(() {
            decodedbytes = base64.decode(base64string);            });
         augustus2 = decodedbytes.length; 
         augustus3 = 1;  
         });
         }}
         
   catch (e) {       
          print('convert has failed' + e.toString());
          }
       }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('augustus'),
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Load_image()),);
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
            child: Text('Final result',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
      body: augustus3 == 1 ? SafeArea(
                child: Container(         
                  decoration : BoxDecoration(
                     gradient: LinearGradient(
                      //  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 174, 217, 255)],
                      //  colors: [Color.fromARGB(255, 96, 165, 239), Color.fromARGB(255, 153, 204, 250)], // mahmoud
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),         
                  child: Card(
                    color: Colors.white,
                    shape: Border.all(color: Colors.black),
                    child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 7.0 ,),
                        children: <Widget>[
                          
                          SizedBox(height: 15),
                         Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0 , vertical: 5),          
                                                  child: Column(children: <Widget>[
                                                    SizedBox(height: 10),
                                                  ])),


                                Container(
                                  decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Color.fromARGB(255, 185, 216, 242),
                                                            width: 2),
                                                        ),
                                  height:370,
                                  margin: EdgeInsets.symmetric(horizontal: 7.0 , vertical: 7),                                
                                  padding: EdgeInsets.symmetric(horizontal: 7.0 , vertical: 2),                                
                                        child: ListView(
                                          children: <Widget>[
                                          SizedBox(height: 10),
                                          
                                          SizedBox(height: 5),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                              
                                                Column(
                                                  children: <Widget>[
                  
                                                    Text(
                                            '$final_result',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: dangerous_lessions // our mailgnant outputs lession
                                                      .contains(final_result)
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                          SizedBox(height:5),
                                                    Row(
                                                      children: [
                  
                                              Text(
                                                 'confidence :',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Color.fromARGB(255, 0, 0, 0)),
                                                    ),
                                                     SizedBox(width: 10,),
                  
                                                     Text(
                                                      '${Final_score}%',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black),
                                                    ),
                                                      ],
                                                    ),
                                                 SizedBox(height: 20,),
                                                 Container(
                                                  height: 180,
                                                  width: 180,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child :ClipRRect(
                                                      borderRadius:BorderRadius.circular(20),
                                                      child:  Image.memory(decodedbytes,fit: BoxFit.fill,)
                                                      ),),

                                                  SizedBox(height: 30),    

                                                  affected_area != null ?
                                                  Container(
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child :  Text('Affected area : $affected_area',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1),

                                                  affected_area_size != null ?
                                                  Container(
                                                  margin : EdgeInsets.only(top: 5),                                                      
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child :  Text('Size of affected area : $affected_area_size',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1),

                                                  duration_injury != null ?
                                                  Container(
                                                  margin : EdgeInsets.only(top: 5),                                                      
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child :  Text('Duration of injury : $duration_injury',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1),

                                                  
                                                  itch != null ?
                                                  Container(
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child :  Text('Does it itch : $itch',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1),


                                                  fever != null ? 
                                                  Container(
                                                  margin : EdgeInsets.only(top: 5),                                                      
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child : Text('Do you have a fever : $fever',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1,),
                                                    
                                                    
                                                  affected_area_shape != null ?
                                                   Container(
                                                  margin : EdgeInsets.only(top: 5),                                                      
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child : Text('Shape of affected area: $affected_area_shape',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1,),

                                                  affected_area_color != null ?
                                                  Container(
                                                  margin : EdgeInsets.only(top: 5),                                                      
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child :  Text('Color of affected area: $affected_area_color',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1,),
                                                  
                                                  tissue_damage != null ?
                                                  Container(
                                                  margin : EdgeInsets.only(top: 5),  
                                                  height: 30,
                                                  width: 300,
                                                  alignment: Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    border:Border.all(width : 3, color : Colors.white),
                                                    borderRadius: BorderRadius.circular(20)),
                                                    child :  Text('Tissue damage: $tissue_damage',
                                                    style:TextStyle(fontSize:17)))
                                                    : Container(height: 1,),                                                    
                                                             ],
                                                ),
                                              ]),
                                          SizedBox(height: 10),
                                        ]
                                        
                                        )
                                        ),
                  
                  
                  
                        
                       SizedBox(height: 5),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 5),
                                padding: EdgeInsets.only(left: 5,right: 5),
                                width:double.infinity,
                                height:100,
                                child: Card(
                                  color: Colors.white,
                                  shape: Border.all(color: Colors.black),
                                  child: InkWell(
                                    onTap: ()  async {
                                             setState(() {
                                      diseases_or_test = 'test';
                                     });
                  
                                     await savePref();
                  
                                   if (final_result == 'Melanoma'){
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Melanoma()),); 
                                     }  
                                          
                                  if (final_result == 'Benign Keratosis'){
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Benign_keratosis()),); 
                                     }
                                  if (final_result == 'Vascular Lesion'){
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Vascular_lesion()),); 
                                     }                                                                     
                                
                                     if (final_result == 'Melanocytic Nevus'){
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Melanocytic_nevus()),); 
                                     }
                  
                                     if (final_result == 'Dermatofibroma'){
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Dermatofibroma()),); 
                                     }
                  
                                     if (final_result == 'Actinic Keratosis'){
                                      print('Actinic_keratosis');
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Actinic_keratosis()),); 
                                     }
                  
                                     if (final_result == 'Basal Cell Carcinoma'){
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Basel()),); 
                                     }  
                                     
                                     if (final_result == 'Squamous Cell Carcinoma'){
                                            Navigator.of(context).pop();
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => Cancer()),); 
                                     }   
                  
                                    }, // should add diseases page 
                                      splashColor: Colors.yellow,
                                      child: Ink(
                                        child: ListTile(
                                          minLeadingWidth : 0,  
                                          horizontalTitleGap: 16.0,                                     
                                          leading: Icon(Icons.info,color: Colors.black ),
                                          title: Text(
                                            '$final_result',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 25, color: Colors.black),
                                          ),
                                          subtitle: Text(
                                          infotxt,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                            textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 14, color: Colors.black ),
                                          ),
                                        ),
                                        height: 100,
                                        width: 100,),),),),  
                                        SizedBox(height: 10),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 50.0,
                                          width: 350,
                                          margin: EdgeInsets.symmetric(horizontal : 10,vertical: 5),
                                          child: ElevatedButton(
                                            onPressed : (){
                                               Navigator.of(context).pop();
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => Test_Home_page()),); 
                                            },
                                            style: ElevatedButton.styleFrom(
                          primary:Color.fromARGB(255, 243, 33, 33),
                          fixedSize: Size(300, 100),
                            shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(80.0)),
                                   padding: EdgeInsets.all(0.0),),
                                   child: Ink(
                     decoration: BoxDecoration(
                         gradient: LinearGradient(
                       colors: [Color.fromARGB(255, 66, 120, 212), Color.fromARGB(255, 79, 151, 213)],
                           begin: Alignment.centerLeft,
                           end: Alignment.centerRight,
                         ),
                         borderRadius: BorderRadius.circular(30.0)),
                     child: Container(
                       constraints:
                           BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                       alignment: Alignment.center,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                         "Try another test",
                         textAlign: TextAlign.center,
                         style: TextStyle(color: Colors.white, fontSize: 20),
                       ),
                        ],
                       )
                     ),
                                   ),
                                 ),
                               ),
                                   
                  
                      ]
                      ),
                  ),
                )
                  ) :
                  Container(
                    child: CircularProgressIndicator(),
                alignment: Alignment.center,
                  )   
    );
  }
}