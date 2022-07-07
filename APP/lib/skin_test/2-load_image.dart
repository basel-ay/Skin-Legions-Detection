import 'dart:io';
import 'package:flutter_application_1/advanced_test/1-affected_area.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter_application_1/skin_test/3-display_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart' show rootBundle;


enum imgSrc { camera, gallery }

class Load_image extends StatefulWidget {
  const Load_image({ Key? key }) : super(key: key);

  @override
  State<Load_image> createState() => _Load_imageState();
}


class _Load_imageState extends State<Load_image> {
   late File _image;
  bool _loading = true;
  final picker = ImagePicker();
  late bool _modelLoading;
  late bool _modelPredicting;
  late List _output;
  // int not_image_ok = 0;


  String base64string = 'Not Selected';
  String augustus_output = '';
  String augustus_confidence = '';  
  String augustus_error = '';
  var loaded_image = 0;
  int temp = 0;
  late String _infotxt;
  var quick_advanced ;

  var name ;
  var email ;  
  var phone ;
  var password;

  Future<void> getText(String path) async {
    final _loadedData = await rootBundle.loadString(path);
    setState(() {
      _infotxt = _loadedData;
    });
  }
  
  
  
  
  deletePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
    });
    print('Data is cleared');
  }

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      quick_advanced = prefs.getString('diseases_or_test');
      name = prefs.getString('name');
      email = prefs.getString('email');
      phone = prefs.getString('phone');
      password = prefs.getString('password');
      quick_advanced = prefs.getString('quick_advanced');

      print(password);

    });
    print('get Pref of quick_advanced has been done');
    print('---------------------------------------------------');
    print(quick_advanced);
  }

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uint8List imagebytes = await _image.readAsBytes(); //convert to bytes
    base64string = base64.encode(imagebytes); //convert bytes to base64 string                
    setState(() {
      // prefs.setString('skin_or_not', 'var_skin_or_not');  
      prefs.setString('base64string', base64string);   
      prefs.setString('label_output', augustus_output);  
      prefs.setString('confidence_output', augustus_confidence);  
      prefs.setString('infotxt', _infotxt);
      prefs.setString('name', name);
      prefs.setString('email', email);
      prefs.setString('phone', phone);
      prefs.setString('password', password);
      prefs.setString('quick_advanced', quick_advanced);
      // prefs.setString('affected_area', '');

    
    
    });
    
    print('save prefs done successfllly');
  } 



  Future loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }
  


  ///Tries to load image from either gallery or camera depening on [scr]. If successfull, calls classify function on image.
  Future getImagePrediction(imgSrc src) async {
    // get image file via picker
    final pickedFile = (src == imgSrc.gallery)
        ? await picker.getImage(source: ImageSource.gallery)
        : await picker.getImage(source: ImageSource.camera);
    // change state and call classify if successfull
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _modelPredicting = true;
      }
    });
 
    if (_image != null) {
     try {
        classifyImg(_image);
     } catch (e) {
      setState(() {
        augustus_error = 'Error !please sir try another picture ';
      });
     }
      
    }
  }

  /// classifies image on tensor flow lite model and loads infotext file based on prediction
  Future classifyImg(File image) async {
    // predict with tflite model
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 9,
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.5,
    );

    getText('assets/${output![0]["index"]}.txt').then((value) {
      setState(() {
        _modelPredicting = false;
        _output = output;
        _loading = false;
        // print(_infotxt);
        print('${output[0]["index"]}');
      });
    });

    setState(() {
      _output = output;
      _loading = false;
      _modelPredicting = false;      
        try {
          augustus_output = '${_output[0]['label']}';
        // augustus_confidence = '${(_output[0]['confidence']*100).toStringAsFixed(2)}';
        augustus_confidence = '${(_output[0]['confidence']*100).round()}';
        augustus_error = '';
        loaded_image = 0;
        temp = 1;
        } catch (e) {
          augustus_output = '';
          augustus_confidence = ''; 
        augustus_error = 'Error !please sir try another picture ';
        temp = 1;
        loaded_image = 1;
        print(e.toString());          
        }
    });
  }


   
  //init state
  @override
  void initState() {
    super.initState();
    _modelLoading = true;
    _modelPredicting = false;
    //load tflite model
    loadModel().then((value) {
      setState(() {
        _modelLoading = false;
      });
    });
    getPref();
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
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
            child: Text('Image selection',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
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


      body: temp == 0 ? 
      Container(

              decoration : BoxDecoration(
                     gradient: LinearGradient(
                      //  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 174, 217, 255)],
                      //  colors: [Color.fromARGB(255, 96, 165, 239), Color.fromARGB(255, 153, 204, 250)], // mahmoud
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: 
            Container(
              margin: EdgeInsets.only(top: 18,left: 18,right: 18,bottom: 5),
              width:double.infinity,
              height:double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
              width: 3,
              color: Colors.black
          )),
                     
                child: InkWell(
                   onTap: ()  {
                    try {
                       setState(() {
                      getImagePrediction(imgSrc.gallery);
                     });
                     } catch (e) {
                      Navigator.of(context).pop();              
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);
                     }             
                   },
                    // Handle your callback.
                 splashColor: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                       image: DecorationImage(
                       image: AssetImage("assets/upload.png"),
                        fit: BoxFit.cover,
                         ),
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text('Import Image' , style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),
                        SizedBox(height: 5,),
                        Text('select a mole or skin lesion' , style: TextStyle(fontSize: 15,)),
                        Text('photograph from your gallary' , style: TextStyle(fontSize: 15,))
                      ],
                    )
                 ),
              ),
            ),
            ),


             Expanded(
              flex: 1,
              child: 
            Container(
              margin: EdgeInsets.only(top: 5,left: 18,right: 18,bottom: 18),
              width:double.infinity,
              height:double.infinity,
              child: Card(
                
                  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
              width: 3,
              color: Colors.black
          )),
                
                child: InkWell(
                   onTap: ()  {
                     try {
                       setState(() {
                      getImagePrediction(imgSrc.camera);
                     });
                     } catch (e) {
                      Navigator.of(context).pop();              
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);
                     }

                   },
                    // Handle your callback.
                 splashColor: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        // border: Border.all(width:3,color:Color.fromARGB(255, 2, 2, 2)),
                       image: DecorationImage(
                       image: AssetImage("assets/camera.png"),
                        fit: BoxFit.cover,
                         ),
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text('Take a photo' , style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),
                        SizedBox(height: 5,),
                        Text('Rapidly take a photo of the skin' , style: TextStyle(fontSize: 15,)),
                        Text('region for analysis' , style: TextStyle(fontSize: 15,))
                      ],
                    )
                 ),
              ),
            ),
            ),


          ],
        ),
      )

        
        /// form of diplaying images and results
        :Container(
          width:  double.infinity,
          height: double.infinity,
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
            children: [
                  SizedBox(height: 20,),
              loaded_image == 0 ? Container(
                  decoration : BoxDecoration(
                    border : Border.all(width:1,color:Color.fromRGBO(1, 5, 53, 1)),
                  borderRadius : BorderRadius.circular(50),
                ),
                  margin:EdgeInsets.all(20),
                  height :270,
                  width :270,
                   child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                  _image,
                  fit: BoxFit.fill,
                  ),
                  )
                  )
              : Container(),

          Container(
            child : Column(
              children: [
                 Text('$augustus_error')    ,
                //  not_image_ok == 1 ? Text('Not a good image to use please select a another skin image') : Container(),
               SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.center,
               height: 50.0,
               width: 300,
               margin: EdgeInsets.all(10),
               child: ElevatedButton(
                 onPressed: ()  async {
                             await  getPref();
                             deletePref();
                              await savePref(); 
                                
                            if (augustus_output == 'Unknown' ) {
                             
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Image validation Error',
                                desc: 'pls sir try to add another image or continue if you want',
                                btnCancelOnPress: () async {
                                  setState(()  {
                                    temp = 0;
                                     augustus_error = 'we don\'t think it\'s a skin image';
                                  });
                                },
                                btnOkOnPress: ()  {
                                  setState(() {
                                     if (quick_advanced == 'advanced'){
                                    Navigator.of(context).pop();              
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area()),);
                                  }
                                  else{
                                    
                                    Navigator.of(context).pop();              
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);
                                  }
                                    
                                    
                                  
                                  });
                                }, )..show();}

                                else{
                                  
                                  print('---------------------------------');
                                  print(quick_advanced);

 
                                  if (quick_advanced == 'advanced'){
                                    Navigator.of(context).pop();              
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => Affected_area()),);
                                  }
                                  else{
                                  deletePref();
                                  await savePref();                                    
                                    Navigator.of(context).pop();              
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);
                                  }
                                  
                                    
                                }
                  },
                 style: ElevatedButton.styleFrom(
                        primary:Color.fromARGB(255, 243, 33, 33),
                        fixedSize: Size(350, 100),
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
                         BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                     alignment: Alignment.center,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                       "Processed",
                       textAlign: TextAlign.center,
                       style: TextStyle(color: Colors.white, fontSize: 20),
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
               width: 300,
               margin: EdgeInsets.all(10),
               child: ElevatedButton(
                 onPressed: () {
                  setState(() {
                    temp = 0;
                  });
                 },
                 style: ElevatedButton.styleFrom(
                        primary:Color.fromARGB(255, 243, 33, 33),
                        fixedSize: Size(350, 100),
                          shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(80.0)),
                 padding: EdgeInsets.all(0.0),),
                 child: Ink(
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                       colors: [Color.fromARGB(255, 66, 120, 212), Color.fromARGB(255, 79, 151, 213)],

                        //  colors: [Colors.green, Color.fromARGB(255, 36, 129, 8),],
                         begin: Alignment.centerLeft,
                         end: Alignment.centerRight,
                       ),
                       borderRadius: BorderRadius.circular(30.0)),
                   child: Container(
                     constraints:
                         BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
                     alignment: Alignment.center,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                       "Back to take another photo",
                       textAlign: TextAlign.center,
                       style: TextStyle(color: Colors.white, fontSize: 20),
                     ),
                      ],
                     )
                   ),
                 ),
               ),
             ),

             SizedBox(height: 5,),
                             
              ],
            ),
          ), 
            ]),
        )
                
    
        );
  }
}
