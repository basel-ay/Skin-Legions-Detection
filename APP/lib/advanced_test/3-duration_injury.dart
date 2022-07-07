import 'package:flutter/material.dart';
import 'package:flutter_application_1/advanced_test/2-affected_area_size.dart';
import 'package:flutter_application_1/advanced_test/4-itch.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Duration_injury extends StatefulWidget {
  const Duration_injury({Key? key}) : super(key: key);

  @override
  State<Duration_injury> createState() => Dduration_injuryState();
}

class Dduration_injuryState extends State<Duration_injury> {

  var duration_injury;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('duration_injury', duration_injury);
      print('duration_injury is saved');
      print(duration_injury);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_size()),);
                             }, icon: Icon(Icons.arrow_back_outlined)
            ),
        
         actions: [
           IconButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);           
                }, icon: Icon(Icons.home_outlined)),
            
        ],
        flexibleSpace: Expanded(
          child: Container(
            padding:EdgeInsets.only(top:35),
            child: Text('Duration of injury',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
                      //  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 174, 217, 255)],
                      //  colors: [Color.fromARGB(255, 96, 165, 239), Color.fromARGB(255, 153, 204, 250)], // mahmoud
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [     
            SizedBox(height:10), 
            
                              Column(
                                children: [
                                  Container(
                                    width: 350,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(''' How long have you had''',style: TextStyle(fontSize:30,),),
                                        Text(''' this condition?''',style: TextStyle(fontSize:30,),),
                                      ],
                                    ),)  ,
                       
                                 
                                  
                                  SizedBox(height:30,),
                                  Container(
                                    alignment:Alignment.center,
                                    width: 280,height:55,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: ()  async {
                                            setState(() {           
                                              duration_injury= 'Minutes to Hours';});
                                              await savePref();
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Itch()),);}, 
                                              
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Minutes to Hours',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 280,height:55,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: ()  async {
                                            setState(() {           
                                              duration_injury= 'Days to Weeks';});
                                              await savePref();
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Itch()),);}, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Days to Weeks',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 280,height:55,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: ()  async {
                                            setState(() {           
                                              duration_injury= 'Weeks to Months';});
                                              await savePref();
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Itch()),);}, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Weeks to Months',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 280,height:55,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: ()  async {
                                            setState(() {           
                                              duration_injury= 'Months to Years';});
                                              await savePref();
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Itch()),);}, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Months to Years',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),

                                Container(
                                    alignment:Alignment.center,
                                    width: 280,height:55,
                                    padding:EdgeInsets.symmetric(vertical : 2,horizontal: 5),
                                    child: SizedBox(
                                              height: double.infinity,
                                              width: double.infinity,

                                      child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                                        child: InkWell(
                                          onTap: ()  async {
                                            setState(() {           
                                              duration_injury= 'Recurring Episodes';});
                                              await savePref();
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Itch()),);}, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Recurring Episodes',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 1, 70, 126)  ),
                                                  ),
                                              ),),),),
                                    ),
                                  ),        

                                ],
                              ),


          ],
        ),
      ),     
      
    );
  
  }}