import 'package:flutter/material.dart';
import 'package:flutter_application_1/advanced_test/2-affected_area_size.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Affected_area extends StatefulWidget {
  const Affected_area({Key? key}) : super(key: key);

  @override
  State<Affected_area> createState() => _Affected_areaState();
}

class _Affected_areaState extends State<Affected_area> {
  
  var affected_area;
  var fron_back = 'front';

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('affected_area', affected_area);
      print('affected_area is saved');
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Test_Home_page()),);
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
            child: Text('Affected area',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
          // color: Colors.red,
          width: double.infinity,
          height: double.infinity,
          decoration : BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color.fromARGB(221, 26, 100, 170), Color.fromARGB(255, 227, 245, 255)],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),   
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 250,
                padding:EdgeInsets.all(5),
                child: Container(
                  decoration : BoxDecoration(
                  image: DecorationImage(
                    image: fron_back == 'front' ? AssetImage('images/area1.png') : AssetImage('images/area2.png'),
                    fit: BoxFit.fill,
                    ),
                ),
                  width:double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisSize : MainAxisSize.max,
                    children: [
                    Row(
                      mainAxisAlignment :MainAxisAlignment.center, 
                      children: [
                        ElevatedButton(
                            onPressed: ()  async {
                              setState(() {
                                affected_area = 'Head';
                              });
                              
                              await savePref();
                              Navigator.of(context).pop();
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);     
                            },                          
                            child: Text('0',style:TextStyle(color:Colors.red,fontSize:20,),),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                primary: Colors.white,
                                shape: CircleBorder(),)),
                      ],
                    ),

                    SizedBox(height:40),
                    Row(
                      mainAxisAlignment :MainAxisAlignment.center, 
                      children: [
                        ElevatedButton(
                            onPressed: ()  async {
                              setState(() {
                                affected_area = 'Chest';
                              });
                              
                              await savePref();
                              Navigator.of(context).pop();
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);     
                            },                        
                            child: Text('1',style:TextStyle(color:Colors.red,fontSize:20,),),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                primary: Colors.white,
                                shape: CircleBorder(),)),
                      ],
                    ),

                    SizedBox(height:30),
                    Row(
                      mainAxisAlignment :MainAxisAlignment.spaceBetween, 
                      children: [
                        ElevatedButton(
                            onPressed: ()  async {
                              setState(() {
                                affected_area = 'Upper Limb';
                              });
                              
                              await savePref();
                              Navigator.of(context).pop();
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);     
                            },                           
                            child: Text('2',style:TextStyle(color:Colors.red,fontSize:20,),),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                primary: Colors.white,
                                shape: CircleBorder(),)),
                        ElevatedButton(
                            onPressed: ()  async {
                              setState(() {
                                affected_area = 'Abdominal area';
                              });
                              
                              await savePref();
                              Navigator.of(context).pop();
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);     
                            },                         
                            child: Text('3',style:TextStyle(color:Colors.red,fontSize:20,),),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                primary: Colors.white,
                                shape: CircleBorder(),)),        
                        ElevatedButton(
                            onPressed: ()  async {
                              setState(() {
                                affected_area = 'Upper Limb';
                              });
                              
                              await savePref();
                              Navigator.of(context).pop();
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);     
                            },                           
                            child: Text('4',style:TextStyle(color:Colors.red,fontSize:20,),),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                primary: Colors.white,
                                shape: CircleBorder(),)),        
                      ],
                    ),


                    SizedBox(height:109),
                    Row(
                      mainAxisAlignment :MainAxisAlignment.start, 
                      children: [
                        SizedBox(width: 56,),
                        ElevatedButton(
                            onPressed: ()  async {
                              setState(() {
                                affected_area = 'Lower Limb';
                              });
                              
                              await savePref();
                              Navigator.of(context).pop();
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);     
                            },                           
                            child: Text('5',style:TextStyle(color:Colors.red,fontSize:20,),),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                primary: Colors.white,
                                shape: CircleBorder(),)),        
                        ElevatedButton(
                            onPressed: ()  async {
                              setState(() {
                                affected_area = 'Lower Limb';
                              });
                              
                              await savePref();
                              Navigator.of(context).pop();
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);     
                            },                           
                            child: Text('6',style:TextStyle(color:Colors.red,fontSize:20,),),
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                primary: Colors.white,
                                shape: CircleBorder(),)),        
                      ],
                    ),                    
                          

                      
          
                  ],),
                )
                ),

                Row(
                  mainAxisAlignment :MainAxisAlignment.start,
                  children: [
                    
                    SizedBox(width:30),     

                    Container(
                      padding:EdgeInsets.all(5),
                      decoration : BoxDecoration(
                      color : Colors.white, 
                      border : Border.all(width : 1,color:Colors.white), 
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: fron_back == 'front' ? AssetImage('images/area2.png') : AssetImage('images/area1.png'),
                          fit: BoxFit.fill,),),
                      width : 50,
                      height : 70,
                      child: InkWell(
                          onTap: ()  {  
                            fron_back == 'front' ? setState(() {fron_back = 'back';}) : setState(() {fron_back = 'front';}) ;}
                          , // should add diseases page 
                          splashColor: Colors.amber,
                      ),),
                      
                      
                      SizedBox(height:30),     
                  ],
                )
            ],
          ) 
          
         ),
      
    );
  
  }}