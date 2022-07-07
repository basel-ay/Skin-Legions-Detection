
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
       appBar: AppBar(
         systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Colors.black,
             statusBarIconBrightness: Brightness.dark
         ),
         backwardsCompatibility: false,
         title: Text('Home',
           style: TextStyle(
             color: Colors.black,
           ),
         ),
         iconTheme: IconThemeData(
             color: Colors.black
         ),
         backgroundColor: Colors.white,
       ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(imageFile != null)
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                //  color: Colors.grey,
                  image: DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover,
                  ),
                  border: Border.all(width: 8, color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            else
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(width: 8, color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Image should appear here',
                  style:
                  TextStyle(
                      fontSize: 26,
                    color: Colors.black
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){
                      getImage(
                          source: ImageSource.camera
                      );
                    },
                    child:  Text(
                      'Capture Image',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white)
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){
                      getImage(
                          source: ImageSource.gallery
                      );},
                    child: const Text('Select Image',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        )),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white)
                    ),

                  ),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){
                      getImage(
                          source: ImageSource.gallery
                      );},
                    child: const Text('Check',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        )),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white)
                    ),

                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {

    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 70 //0 - 100
    );

    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}