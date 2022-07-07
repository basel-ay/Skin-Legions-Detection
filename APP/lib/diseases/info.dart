import 'package:flutter_application_1/diseases/diseases.dart';
import 'package:flutter_application_1/history/history.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter_application_1/skin_test/3-display_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Info extends StatefulWidget {
  const Info({ Key? key }) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
bool agree = false;
   var infotxt;

  Future<void> _loadData() async {
    final _loadedData = await rootBundle.loadString('assets/9.txt');
    setState(() {
      infotxt = _loadedData;
      print(infotxt);
    });
  }


@override
void initState() {
  _loadData() ;
  super.initState();
}

  @override
  void dispose() {
    super.dispose();
    }

@override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        // title: Text('augustus'),
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
            child: Text('information',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
        decoration : BoxDecoration(
                     gradient: LinearGradient(
                      //  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 174, 217, 255)],
                      //  colors: [Color.fromARGB(255, 96, 165, 239), Color.fromARGB(255, 153, 204, 250)], // mahmoud
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),  
        child: ListView(
          children: [ 
            SizedBox(height:10),   
            Container(
              // decoration: BoxDecoration( border: Border.all(width:1  , color: Color.fromARGB(221, 0, 0, 0)),color: Color.fromARGB(255, 255, 255, 255),),
              height: 300,
              width: double.infinity,
              padding:EdgeInsets.symmetric(vertical : 5,horizontal: 5),
              child:  Image.asset(
                          'assets/cancer1.gif',
                          fit: BoxFit.fill,
                        )),
Container(
                padding:EdgeInsets.symmetric(vertical : 7,horizontal: 5),
                  decoration: BoxDecoration( border: Border.all(width:0.5  , color: Color.fromARGB(221, 255, 255, 255)),color: Color.fromARGB(255, 255, 255, 255),),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '''This app can diagnose pigmented skin lesions via machine learning by classifying your case in these 7 important categories. For better result we recommende using medical knowlodge informations''',
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,color: Colors.black ,
                          
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                               color: Colors.green,
                              border: Border.all(color: Colors.white, width: 1.5),
                            ),
                            child: Text(
                              'Benign tumors',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize:16,color: Colors.white ,fontWeight:FontWeight.bold),
                            ),
                          ),
                          
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                               color: Colors.red,
                                border: Border.all(color: Colors.white, width: 1.5)),
                            child: Text(
                              'Malignant tumors',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize:16,color: Colors.white ,fontWeight:FontWeight.bold),
                            ),
                          )
                        ],
                      ),
              
              
                      SizedBox(height: 10.0),
                      
                      ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.green,
                        ),
                        title: new Text(
                          'Melanocytic nevi',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
              
              
                       ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.red,
                        ),
                        title: new Text(
                          'Melanoma',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                       ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.green,
                        ),
                        title: new Text(
                          'Benign keratosis-like lesions',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                       ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.red,
                        ),
                        title: new Text(
                          'Basal cell carcinoma',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                       ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.red,
                        ),
                        title: new Text(
                          'Actinic keratoses',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                       ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.green,
                        ),
                        title: new Text(
                          'vascular lesions',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                       ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        horizontalTitleGap: 1,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.green,
                        ),
                        title: new Text(
                          'Dermatofibroma',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
              
                      Container(
                  color: Colors.white,
                  // shape: Border.all(color: Colors.black),
                  child: Container(
                    child: Text('$infotxt',style: TextStyle(fontSize: 20, color:Colors.black  ),),
                    // margin: EdgeInsets.all(10),
                    padding:EdgeInsets.all(10),
                    ),),
              
                    ],
                  ),
                
              ),
            
            
          ],
        ),
      ),
      
    );
  
  }}