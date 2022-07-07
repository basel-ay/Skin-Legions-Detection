import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/diseases/info.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/2-load_image.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Test_Home_page extends StatefulWidget {
  const Test_Home_page({ Key? key }) : super(key: key);

  @override
  State<Test_Home_page> createState() => _Test_Home_pageState();
}

class _Test_Home_pageState extends State<Test_Home_page> {
  
  bool agree = false;
  String quick_advanced = 'no selected' ; 



  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();             
    setState(() {
      // prefs.setString('diseases_or_test', quick_advanced);
      prefs.setString('quick_advanced', quick_advanced);       
             
    });
    print('save prefs diseases_or_test done successfllly');
    print(quick_advanced);
  } 

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();}


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
                Navigator.push(context,MaterialPageRoute(builder: (context) => Info()),);           
                }, icon: Icon(Icons.info_sharp,color: Colors.white,)),
            
        ],
        flexibleSpace: Expanded(
          child: Container(
            padding:EdgeInsets.only(top:35),
            child: Text('Skin cancer test',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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

 
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
                    decoration : BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),

          child: ListView(

            children: <Widget>[

              SizedBox(height: 40.0),          
                            Container(
                child: Center(
                  child: Container(

                        padding:EdgeInsets.all(5),
                        height :350,
                        width :350,
                        // child: Image.asset('images/a2.jpg',fit: BoxFit.fill,),
                        child: Image.asset('images/main4.png',fit: BoxFit.fill,),

                      ) 
                ),
              ),
                
                

              Container(
                alignment: Alignment.center,
             height: 50.0,
             width: 200,
             margin: EdgeInsets.all(10),
             child: ElevatedButton(
               onPressed: ()  async {
                     setState(() {
                  quick_advanced = 'advanced';
                });
                 await savePref();
                Navigator.of(context).pop();
                Navigator.push(context,MaterialPageRoute(builder: (context) => Load_image()),);

               },
               style: ElevatedButton.styleFrom(
                      primary:Colors.blue,
                      fixedSize: Size(300, 100),
                        shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(80.0)),
               padding: EdgeInsets.all(0.0),),
               child: Ink(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color.fromARGB(255, 66, 120, 212), Color.fromARGB(255, 79, 151, 213)],

                      //  colors: [Color.fromARGB(255, 17, 33, 61), Color.fromARGB(255, 6, 110, 201)],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                     borderRadius: BorderRadius.circular(30.0)),
                 child: Container(
                   constraints:
                       BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                   alignment: Alignment.center,
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                     "Advanced test",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 25),
                   ),
                    ],
                   )
                 ),
               ),
             ),
           ),
           
              Container(
                alignment: Alignment.center,
             height: 50.0,
             width: 200,
             margin: EdgeInsets.all(10),
             child: ElevatedButton(
               onPressed: ()  async  {
                setState(()  {
                  quick_advanced = 'qucik';
                });

                  await savePref();
                  Navigator.of(context).pop();
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Load_image()),);
               },
               style: ElevatedButton.styleFrom(
                      primary:Colors.blue,
                      fixedSize: Size(300, 100),
                        shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(80.0)),
               padding: EdgeInsets.all(0.0),),
               child: Ink(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color.fromARGB(255, 66, 120, 212), Color.fromARGB(255, 79, 151, 213)],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                     borderRadius: BorderRadius.circular(30.0)),
                 child: Container(
                   constraints:
                       BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                   alignment: Alignment.center,
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                     "Quick test",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 25),
                   ),
                    ],
                   )
                 ),
               ),
             ),
           ),
              
              
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 228, 97, 88),shape: StadiumBorder()),
              //     child: Text('I understand lets check my Lesion', style:TextStyle(fontSize:20,color: Colors.white,fontWeight:FontWeight.bold)),
              //    onPressed: agree ? (){} 
              //    : (){ Navigator.push(context,MaterialPageRoute(builder: (context) => Load_image()),); }  ,
              //    )
            ],
          ),
        ),
      ),
    );
  }
}
