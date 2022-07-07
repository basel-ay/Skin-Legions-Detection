import 'package:flutter/material.dart';
import 'package:flutter_application_1/about_us/abslam.dart';
import 'package:flutter_application_1/about_us/alpha_test.dart';
import 'package:flutter_application_1/about_us/basel.dart';
import 'package:flutter_application_1/about_us/hamed.dart';
import 'package:flutter_application_1/about_us/mazen.dart';
import 'package:flutter_application_1/about_us/nada.dart';
import 'package:flutter_application_1/about_us/zahwa.dart';
import 'package:flutter_application_1/home.dart';

class About extends StatefulWidget {
  const About({ Key? key }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  String image_path = 'images/team2.jpg';
  var the_best = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('augustus'),
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
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
            child: Text('The Alpha Of Alphas',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
            alignment:Alignment.center,
              decoration: const BoxDecoration(
                
          gradient: LinearGradient(
            
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.black, Colors.blue ]),
            // colors: <Color>[Colors.black, Color.fromARGB(255, 0, 0, 0) ]),

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
                          Column(
                                children: [
 
                                  Container(
                                    margin:EdgeInsets.symmetric(vertical : 10 , horizontal: 20),
                                    height: 270,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('$image_path') ,
                                        fit: BoxFit.fill,),                                      
                                      border:Border.all(width : 3, color : Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                      
                                      // child : Image.asset('$image_path', fit: BoxFit.fill)
                                      child : Column(
                                        children: [
                                                             SizedBox(height:50),
                   Row(
                      // mainAxisAlignment :MainAxisAlignment.spaceBetween, 
                      children: [
                        // ElevatedButton(
                        //     onPressed: ()  {},                          
                        //     child: Text('2',style:TextStyle(color:Colors.red,fontSize:20,),),
                        //       style: ElevatedButton.styleFrom(
                        //         onPrimary: Colors.red,
                        //         primary: Colors.white,
                        //         shape: CircleBorder(),)),
                         
                                         SizedBox(height: 90,),
                                         Container(
                                          height:70,
                                          width:30,
                                           child: InkWell( 
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Zahwa()));
                                            },                                                                          
                                              splashColor: Colors.amber,
                                              child: Ink(
                                                child:  Container(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                              
                                                  )
                                                ),),),
                                         ), 
                                         SizedBox(width: 15,),
                                         Container(
                                          height:80,
                                          width:30,
                                           child: InkWell( 
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Nada()));
                                            },                                                                          
                                              splashColor: Colors.amber,
                                              child: Ink(
                                                child:  Container(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                              
                                                  )
                                                ),),),
                                         ),


                                         SizedBox(width: 38,),
                                         Container(
                                          height:100,
                                          width:30,
                                           child: InkWell( 
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Hamed()));
                                              
                                            },                                                                          
                                              splashColor: Colors.amber,
                                              child: Ink(
                                                child:  Container(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    // color: Colors.red,
                                                  )
                                                ),),),
                                         ),  
                                     
                                  SizedBox(width: 28,),
                                         Container(
                                          height:90,
                                          width:30,
                                           child: InkWell( 
                                            onTap: () {
                                                  Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Abslam()));
                                            },                                                                          
                                              splashColor: Colors.amber,
                                              child: Ink(
                                                child:  Container(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                  )
                                                ),),),
                                         ),  
                                     SizedBox(width: 17,),
                                         Container(
                                          height:100,
                                          width:30,
                                           child: InkWell( 
                                            onTap: () {
                                                Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Mazen()));
                                            },                                                                          
                                              splashColor: Colors.amber,
                                              child: Ink(
                                                child:  Container(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                  )
                                                ),),),
                                         ),  
                                     
                                   SizedBox(width: 25,),
                                         Container(
                                          height:100,
                                          width:35,
                                           child: InkWell( 
                                            onTap: () {
                                                Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Basoola()));
                                            },                                                                          
                                              splashColor: Colors.amber,
                                              child: Ink(
                                                child:  Container(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                  )
                                                ),),),
                                         ),  
                                     
                      ],
                    ),
                                        ],
                                      )
                                      ),
                                 
                                  
                                  Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        
                                        color: the_best == 1? Color.fromARGB(255, 244, 203, 54) : Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell( 
                                          onTap: () {
                                            setState(() {
                                              the_best = 1;
                                              image_path = 'images/hamed.jpg';
                                            });
                                          },                                                                          
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Mohammed Hamed',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,
                                      child: Card(
                                        color: the_best == 2? Color.fromARGB(255, 244, 203, 54) : Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              the_best = 2;
                                              image_path = 'images/basel.jpg';
                                              
                                            });
                                          },                                           
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Basel Ayman',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        
                                        color: the_best == 3? Color.fromARGB(255, 244, 203, 54) : Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              the_best = 3;
                                              image_path = 'images/mazen.jpg';

                                            });
                                          }, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Mazen Tarek',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        
                                        color: the_best == 4? Color.fromARGB(255, 244, 203, 54) : Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              the_best = 4;
                                              image_path = 'images/3bslam.jpg';

                                            });
                                          },  
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Mohammed 3bslam',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        color: the_best == 5? Color.fromARGB(255, 244, 203, 54) : Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              the_best = 5;
                                              image_path = 'images/nada.jpg';

                                            });
                                          }, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Nada Ahmed',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),  

                                Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        color: the_best == 6? Color.fromARGB(255, 244, 203, 54) : Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              the_best = 6;
                                              image_path = 'images/zahwa.jpg';

                                            });
                                          }, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Zahwa Khaled',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),  


                                Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        color: the_best == 7? Colors.white : Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              the_best = 7;
                                              image_path = 'images/team2.jpg';
                                            });
                                          }, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'The Best Team',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),  

                                SizedBox(height: 40,),

                                Container(
                                    alignment:Alignment.center,
                                    width: 300,height:48,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        color: the_best == 7? Colors.white : Colors.white,
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
                                                    'Vatican test',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),   
                                SizedBox(height: 20,),

                                ],
                              ),

          ],
        ),
      ),     
      
        
    );
  }
}