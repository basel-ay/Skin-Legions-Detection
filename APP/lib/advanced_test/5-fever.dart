import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/advanced_test/2-affected_area_size.dart';
import 'package:flutter_application_1/advanced_test/4-itch.dart';
import 'package:flutter_application_1/advanced_test/6-affected_skin.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Fever extends StatefulWidget {
  const Fever({Key? key}) : super(key: key);

  @override
  State<Fever> createState() => _FeverState();
}

class _FeverState extends State<Fever> {

  var fever;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('fever', fever);
      print('Fever is saved');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Itch()),);
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
            child: Text('Fever',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [     
            SizedBox(height:200), 
            
                              Column(
                                children: [
                                  Container(
                                    width: 350,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(''' Do you have or feel a fever ''',textAlign : TextAlign.center,style: TextStyle(fontSize:30,),),
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
                                              fever = 'Yes';});
                                              await savePref();
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_shape()),);}, 
                                              
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Yes',
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
                                              fever = 'No';});
                                              await savePref();
                                              Navigator.of(context).pop();
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_shape()),);}, 
                                            splashColor: Colors.amber,
                                            child: Ink(
                                              child:  Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'No',
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