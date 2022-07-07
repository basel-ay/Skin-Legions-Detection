import 'package:flutter/material.dart';
import 'package:flutter_application_1/advanced_test/1-affected_area.dart';
import 'package:flutter_application_1/advanced_test/2-affected_area_size.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/skin_test/3-display_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tissue_damage extends StatefulWidget {
  const Tissue_damage({Key? key}) : super(key: key);

  @override
  State<Tissue_damage> createState() => _Tissue_damageState();
}

class _Tissue_damageState extends State<Tissue_damage> {
  var tissue_damage;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('tissue_damage', tissue_damage);
      print('Tissue_damage is saved');
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
            child: Text('Type of tissue damage',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
              child: Text(''' What type of tissue damage?''',textAlign: TextAlign.center,
               style: TextStyle(fontSize:30,),),
            )  ,
            
            
            SizedBox(height: 50,),

            Container(
              //  margin: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                   Container(
                  padding:EdgeInsets.all(7),
                  alignment: Alignment.centerLeft,
                  width: 120,
                  decoration: BoxDecoration(
                    // border: Border.all(width : 1,color: Colors.white),
                    // borderRadius:BorderRadius.circular(30),
                  ),
                    child: InkWell(
                      onTap: () async {
                        setState(() {           
                          
                          tissue_damage= 'Thinnin';});
                          await savePref();
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);     }, 
                     splashColor: Colors.amber,
                     child: Ink(
                      child: Column(
                        mainAxisAlignment : MainAxisAlignment.start,
                        children: [
                        Container(
                          height : 80,
                          width : 80,
                          decoration: BoxDecoration(
                            image : DecorationImage(
                              image :  AssetImage('images/thinning.jpg'),
                            ),
                            border : Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(60)
                          ),
                        ),
                          SizedBox(height:10),
                          Container(alignment : Alignment.bottomCenter, child: Text('Thinnin or Atrophy',
                          textAlign: TextAlign.center , style: TextStyle(fontSize:20,),)),   
                      ]),),),
                                      ),

                 SizedBox(width:10),              

                      Container(
                  padding:EdgeInsets.all(7),
                  alignment: Alignment.centerLeft,
                  width: 120,
                  decoration: BoxDecoration(
                    // border: Border.all(width : 1,color: Colors.white),
                    // borderRadius:BorderRadius.circular(30),
                  ),
                    child: InkWell(
                      onTap: () async {
                        setState(() {           
                          
                          tissue_damage= 'Fissures';});
                          await savePref();
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);     }, 
                     splashColor: Colors.amber,
                     child: Ink(
                      child: Column(
                        mainAxisAlignment : MainAxisAlignment.start,
                        children: [
                        Container(
                          height : 80,
                          width : 80,
                          decoration: BoxDecoration(
                            image : DecorationImage(
                              image :  AssetImage('images/fissures.jpg'),
                            ),
                            border : Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(60)
                          ),
                        ),
                          SizedBox(height:10),
                          Container(alignment : Alignment.bottomCenter, child: Text('Fissures or Cracking ',textAlign: TextAlign.center , style: TextStyle(fontSize:20,),)),   
                      ]),),),
                                      ),                 
                                      
                                              
                ],
              ),
            ),
            
            
            SizedBox(height:10),  
            
            Container(
              //  margin: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                   Container(
                  padding:EdgeInsets.all(7),
                  alignment: Alignment.centerLeft,
                  width: 120,
                  decoration: BoxDecoration(
                    // border: Border.all(width : 1,color: Colors.white),
                    // borderRadius:BorderRadius.circular(30),
                  ),
                    child: InkWell(
                      onTap: () async {
                        setState(() {           
                          
                          tissue_damage= 'Scarring';});
                          await savePref();
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);     }, 
                     splashColor: Colors.amber,
                     child: Ink(
                      child: Column(
                        mainAxisAlignment : MainAxisAlignment.start,
                        children: [
                        Container(
                          height : 80,
                          width : 80,
                          decoration: BoxDecoration(
                            image : DecorationImage(
                              image :  AssetImage('images/scarring.jpg'),
                            ),
                            border : Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(60)
                          ),
                        ),
                          SizedBox(height:10),
                          Container(alignment : Alignment.bottomCenter, child: Text('Scarring',
                          textAlign: TextAlign.center , style: TextStyle(fontSize:20,),)),   
                      ]),),),
                                      ),
                 
                 
                 SizedBox(width:20),              

                      Container(
                  padding:EdgeInsets.all(7),
                  alignment: Alignment.centerLeft,
                  width: 120,
                  decoration: BoxDecoration(
                    // border: Border.all(width : 1,color: Colors.white),
                    // borderRadius:BorderRadius.circular(30),
                  ),
                    child: InkWell(
                      onTap: () async {
                        setState(() {           
                          
                          tissue_damage= 'Ulcers';});
                          await savePref();
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);     }, 
                     splashColor: Colors.amber,
                     child: Ink(
                      child: Column(
                        mainAxisAlignment : MainAxisAlignment.start,
                        children: [
                        Container(
                          height : 80,
                          width : 80,
                          decoration: BoxDecoration(
                            image : DecorationImage(
                              image :  AssetImage('images/ulcers.jpg'),
                            ),
                            border : Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(60)
                          ),
                        ),
                          SizedBox(height:10),
                          Container(alignment : Alignment.bottomCenter, child: Text('Ulcers or Erosion',textAlign: TextAlign.center , style: TextStyle(fontSize:20,),)),   
                      ]),),),
                                      ),                 
                                      
                                              
                ],
              ),
            ),        SizedBox(height: 10,),

                   
                  ]),),
                                                         
          
       
      
    );
  
  }}