
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/modules/register_screen/register_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';


class RegisterCubit extends Cubit<RegisterState>
{
  RegisterCubit() : super(initialRegisterState());

  static RegisterCubit get(context) =>BlocProvider.of(context);

  void userRegister({
  required String name,
  required String email,
  required String password,
  required String phone,

  })
{
  print("creat users");
  FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password
  )
  .then((value){
    creteUser(
        uid: value.user?.uid,
        name: name,
        email: email,
        password: password,
        phone: phone,
    );
  }).catchError((onError){
    print(onError.toString());
    emit(errorCreateUserState());
  });
}

  void creteUser({
  required  String? uid,
  required String name,
  required String email,
  required String password,
  required String phone,
  })
  {
    UserModel model = UserModel(
      name: name,
      email: email,
      uid: uid,
      password: password,
      phone: phone,
    );
    emit(loadingRegisterState()
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
         .set(model.toMap())
       .then((value){

      emit(successRegisterState());

    }).catchError((onError)
    {
      emit(errorRegisterState());
    });
  }

}