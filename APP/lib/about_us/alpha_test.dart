import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/about_us/About.dart';
import 'package:flutter_application_1/home.dart';

class Alpha extends StatefulWidget {
  const Alpha({Key? key}) : super(key: key);

  @override
  State<Alpha> createState() => _AlphaState();
}

class _AlphaState extends State<Alpha> {
  String image_path = 'images/team.jpg';
  var alpha = 0;

void show_reults(){
  try {
     {
      Timer(Duration(seconds: 3), () {
               setState(() {
                
                alpha = 1 ;
                image_path = 'images/lol.jpg';         
                
                });
         });
         }}
         
   catch (e) {       
          print('show result has failed' + e.toString());
          }
       }

@override
void initState() {
  super.initState();
  show_reults();

   
}


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
                }, icon: Icon(Icons.home_outlined,color: Colors.white,)),
            
        ],
        flexibleSpace: Expanded(
          child: Container(
            padding:EdgeInsets.only(top:35),
            child: Text('أختبار قياس جودة نظرك',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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

      
            body: Container(
      alignment: Alignment.center,
        decoration : BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),  
        child: ListView(
          children: [       
            
            
                          SizedBox(height : 60),
            
                          Column(
                                children: [
                                  
                                  
                                  Container(
                                    width: 350,
                                    alignment: Alignment.center,
                                    child: Text(''' لا تنظر الى التيم الافضل فى الدفعه''',
                                    style: TextStyle(fontSize:30,),
                                    textAlign: TextAlign.center),)  ,
                                    
                                    
                                    
                                  SizedBox(height : 20),

 
                                  Container(
                                    margin:EdgeInsets.symmetric(vertical : 10 , horizontal: 20),
                                    height: 270,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border:Border.all(width : 3, color : Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                      
                                      child : Image.asset('$image_path', fit: BoxFit.fill)),
                                 


                                  alpha == 1  ? Column(
                                    children: [
                                      Container(
                                        width: 350,
                                        alignment: Alignment.center,
                                        child: Text(''' ههههه خسرت يا نرم''',
                                        style: TextStyle(fontSize:30,),
                                        textAlign: TextAlign.center),),
                                        SizedBox(height:20),
                                       
                               Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        color: Colors.white ,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              
                                            });

                                             Navigator.of(context).pop();
                                             Navigator.push(context,MaterialPageRoute(builder: (context) => Alpha()),);                                            
                                          }, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Try again',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),   


                                       
                                        ],
                                  ) 
                                  : Container()

                                ],
                              ),


          ],
        ),
      ),         
        
    );
  }
}