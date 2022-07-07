
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/modules/login_screen/login_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(initialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  })
  {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
      print(value.user?.email);
      emit(successLoginState());
    }).catchError((onError)
    {
      print(onError.toString());
      emit(errorLoginState());
    });
  }
}