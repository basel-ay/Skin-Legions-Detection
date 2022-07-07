import 'package:flutter/material.dart';
import 'package:flutter_application_1/advanced_test/2-affected_area_size.dart';
import 'package:flutter_application_1/advanced_test/6-affected_skin.dart';
import 'package:flutter_application_1/advanced_test/8-tissue_damage.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Affected_area_color extends StatefulWidget {
  const Affected_area_color({Key? key}) : super(key: key);

  @override
  State<Affected_area_color> createState() => _Affected_area_colorState();
}

class _Affected_area_colorState extends State<Affected_area_color> {
  var affected_area_color;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('affected_area_color', affected_area_color);
      print('Affected_area_color is saved');
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area_shape()),);
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
            child: Text('Affected area color',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
              child: Text(''' What is the color of the 
              affected skin?''',
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
                          
                          affected_area_color= 'Patch';});
                          await savePref();
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Tissue_damage()),);     }, 
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
                              image :  AssetImage('images/patch.jpg'),
                            ),
                            border : Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(60)
                          ),
                        ),
                          SizedBox(height:10),
                          Container(alignment : Alignment.bottomCenter, child: Text('Patch or Mucule',textAlign: TextAlign.center , style: TextStyle(fontSize:20,),)),   
                      ]),),),
                                      ),


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
                          
                          affected_area_color= 'Broad area';});
                          await savePref();
                          Navigator.of(context).pop();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Tissue_damage()),);     }, 
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
                              image :  AssetImage('images/broad_area.jpg'),
                            ),
                            border : Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(60)
                          ),
                        ),
                          SizedBox(height:10),
                          Container(alignment : Alignment.bottomCenter, child: Text('Broad area of color',textAlign: TextAlign.center , style: TextStyle(fontSize:20,),)),   
                      ]),),),
                                      ),                 
                                      
                                              
                ],
              ),
            ),

                    SizedBox(height: 10,),

                   
                  ]),),
       
      
    );
  
  }}