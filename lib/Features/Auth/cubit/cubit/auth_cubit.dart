import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bootcamp/Features/Auth/data/network.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //SingUp
  Future<String> SingUp(String email, String Password) async {
    emit(SingUPLoading());
    try {
      if (email.isEmpty || Password.isEmpty) {
        emit(SingUPLoaded('please fill the fields'));
        return 'please fill the fields';
      } else {
        String re = await authNeteork().sinup(email, Password);
        emit(SingUPLoaded(re));
        return re;
      }
    } catch (e) {
      emit(SingUPerror());
      return e.toString();
    }
  }

  //SingIn
  Future<String> SingIn(String email, String Password) async {
    emit(SingInLoading());
    try {
      if (email.isEmpty || Password.isEmpty) {
        emit(SingInLoaded('please fill the fields'));
        return 'please fill the fields';
      } else {
        String re = await authNeteork().Singin(email, Password);
        emit(SingInLoaded(re));
        return re;
      }
    } catch (e) {
      emit(SingInerror());
      return e.toString();
    }
  }

  // forget password function
  Future<String> forgetPassword(String email) async {
    if (email.isEmpty) {
      emit(ForgetPasswordLoaded('Please write your email'));
      return 'Please write your email';
    }
    emit(ForgetPasswordLoading());
    try {
      String response = await authNeteork().forget_password(email);
      emit(ForgetPasswordLoaded(response));
      return response;
    } catch (e) {
      emit(ForgetPasswordFailed());
      return e.toString();
    }
  }
  // signIn with google function
}
