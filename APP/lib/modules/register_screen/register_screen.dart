import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/login_screen/login_screen.dart';
import 'package:flutter_application_1/modules/register_screen/register_cubit/cubit.dart';
import 'package:flutter_application_1/modules/register_screen/register_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../shared/components/components.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();


  bool agree = false;


  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();             
    
      prefs.setString('name', nameController.text);
      prefs.setString('email', emailController.text);       
      prefs.setString('phone', phoneController.text);       
      prefs.setString('password', passwordController.text);       

    
    print('------------------------------------');
    print('save RegisterScreen done successfllly');
    print(emailController.text);
  } 



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>
        (
        listener: (context, state){},
        builder: (context,state) {
          //TextEditingController controller = TextEditingController();
          return Scaffold(
            body: Container(
                    decoration : BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color.fromARGB(146, 235, 249, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),                            
              height: height,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: height * .005),
                            const SizedBox(
                              height: 50,
                            ),

                                                   Container(
                          margin:EdgeInsets.all(5),
                          height: 250,
                          width: 300,
                          child: Image.asset('images/logo2.png'),
                          ),
                           
                           Container(
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Username',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))
                                       ),),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),


          
                           Container(
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))
                                       ),),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),




                           Container(
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))
                                       ),),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),



                           Container(
                                child: TextFormField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone_android),
                                    hintText: 'Phone',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))
                                       ),),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),


                      
              Container(
                alignment: Alignment.center,
             height: 50.0,
             width: 350,
             margin: EdgeInsets.all(10),
             child: ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).userRegister(
                                      //  uid: uid,
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                            await savePref();
                                          Navigator.of(context).pop();
                                          Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()),);


                                },
               style: ElevatedButton.styleFrom(
                      primary:Colors.blue,
                      fixedSize: Size(350, 100),
                        shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0)),
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
                     "Register Now",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 25),
                   ),
                    ],
                   )
                 ),
               ),
             ),
           ),
             

                            // SizedBox(height: height * .14),
                            _loginAccountLabel(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    ),
    );
    }
  }



  Widget _loginAccountLabel(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Already have an account ?',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Login',
              style: const TextStyle(
                  color:Color.fromARGB(255, 206, 104, 20),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }



