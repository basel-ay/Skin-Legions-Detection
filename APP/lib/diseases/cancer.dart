import 'package:flutter_application_1/diseases/diseases.dart';
import 'package:flutter_application_1/history/history.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/3-display_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class Cancer extends StatefulWidget {
  const Cancer({ Key? key }) : super(key: key);

  @override
  State<Cancer> createState() => _CancerState();
}

class _CancerState extends State<Cancer> {
  @override

  
  bool agree = false;
   var infotxt;

  Future<void> _loadData() async {
    final _loadedData = await rootBundle.loadString('assets/cancer.txt');
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
              Navigator.push(context,MaterialPageRoute(builder: (context) => Diseases()),);
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
            child: Text('What is skin cancer',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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
              height: 300,
              width: double.infinity,
              padding:EdgeInsets.symmetric(vertical : 0,horizontal: 5),
              child: Card(
                color: Colors.white,
                // shape: Border.all(color: Colors.black),
                child: Image.asset(
                          'assets/cancer.jpg',
                          fit: BoxFit.fill,
                        ))),
            Container(
              child: Card(
                color: Colors.white,
                // shape: Border.all(color: Colors.black),
                child: Container(
                  child: Text('$infotxt',style: TextStyle(fontSize: 18, color:Colors.black  ),),
                  // margin: EdgeInsets.all(10),
                  padding:EdgeInsets.all(10),
                  ),),),
          ],
        ),
      ),
      
    );
  
  }}