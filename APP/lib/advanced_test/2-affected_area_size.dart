import 'package:flutter/material.dart';
import 'package:flutter_application_1/advanced_test/1-affected_area.dart';
import 'package:flutter_application_1/advanced_test/2-affected_area_size.dart';
import 'package:flutter_application_1/advanced_test/3-duration_injury.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Affected_area_size extends StatefulWidget {
  const Affected_area_size({Key? key}) : super(key: key);

  @override
  State<Affected_area_size> createState() => _Affected_area_sizeState();
}

class _Affected_area_sizeState extends State<Affected_area_size> {
  var affected_area_size;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('affected_area_size', affected_area_size);
      print('affected_area_size is saved');
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area()),);
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
            child: Text('Affected area size',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
          alignment : Alignment.center,
          // color: Colors.red,
          width: double.infinity,
          height: double.infinity,
          padding : EdgeInsets.all(10),
          decoration : BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),   
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              width: 350,
              alignment: Alignment.center,
              child: Text(''' How much of the body is
               affected?''',
               style: TextStyle(fontSize:30,),),
            )  ,
            
            
            SizedBox(height: 10,),

            Container(
              padding:EdgeInsets.all(7),
              alignment: Alignment.centerLeft,
              width: 350,
              decoration: BoxDecoration(
                // border: Border.all(width : 1,color: Colors.white),
                // borderRadius:BorderRadius.circular(30),
              ),
                child: InkWell(
                  onTap: () async {
                    setState(() {           
                      
                      affected_area_size= 'Single lesion';});
                      await savePref();
                      Navigator.of(context).pop();
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Duration_injury()),);     }, 
                 splashColor: Colors.amber,
                 child: Ink(
                  child: Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                    Container(
                      decoration: BoxDecoration(
                        border:Border.all(width : 3, color : Colors.white),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: CircleAvatar( 
                        radius: 40, // Image radius
                        child : Image(image:  AssetImage('images/Single_esion.jpg'),
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,),),
                    ),
                      SizedBox(width:20),
                      Container(
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                          Container(width: 200, child: Text('Single lesion',style: TextStyle(fontSize:24,),)),
                          Container(width: 200, child: Text('A single lesion or growth',style: TextStyle(fontSize:15,),)),
                          
                        ]),
                      )
                  ]),),),
                                  ),

                    SizedBox(height: 10,),


                  Container(
              padding:EdgeInsets.all(7),
              alignment: Alignment.centerLeft,
              width: 350,
              decoration: BoxDecoration(
                // border: Border.all(width : 1,color: Colors.white),
                // borderRadius:BorderRadius.circular(30),
              ),
                child: InkWell(
                  onTap: () async {
                    setState(() {           
                      affected_area_size = 'Limited area';});
                      await savePref();
                      Navigator.of(context).pop();
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Duration_injury()),);},
                 splashColor: Colors.amber,
                 child: Ink(
                  child: Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                    Container(
                      decoration: BoxDecoration(
                        border:Border.all(width : 3, color : Colors.white),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: CircleAvatar( 
                        radius: 40, // Image radius
                        child : Image(image:  AssetImage('images/Limited_area.jpg'),
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,),),
                    ),
                      SizedBox(width:20),
                      Column(children: [
                          Container(width: 200, child: Text('Limited Area',style: TextStyle(fontSize:24,),)),
                          Container(width: 200, child: Text('Multiple lession or rash',style: TextStyle(fontSize:15,),)),                        

                      ])
                  ]),),),
                                  ),

                    SizedBox(height: 10,),


                    Container(
              padding:EdgeInsets.all(7),
              alignment: Alignment.centerLeft,
              width: 350,
              decoration: BoxDecoration(
                // border: Border.all(width : 1,color: Colors.white),
                // borderRadius:BorderRadius.circular(30),
              ),
                child: InkWell(
                  onTap: () async {
                    setState(() {           
                      affected_area_size = 'Widespread';});
                      await savePref();
                      Navigator.of(context).pop();
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Duration_injury()),);}, 
                 splashColor: Colors.amber,
                 child: Ink(
                  child: Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                    Container(
                      decoration: BoxDecoration(
                        border:Border.all(width : 3, color : Colors.white),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: CircleAvatar( 
                        radius: 40, // Image radius
                        child : Image(image:  AssetImage('images/Widespread.jpg'),
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,),),
                    ),
                      SizedBox(width:20),
                      Column(children: [
                          Container(width: 200, child: Text('Widespread',style: TextStyle(fontSize:24,),)),
                          Container(width: 200, child: Text('Affecting most of the body',style: TextStyle(fontSize:15,),)),                           

                      ])
                  ]),),),
                                  ),                              
          ],))
       
      
    );
  
  }}