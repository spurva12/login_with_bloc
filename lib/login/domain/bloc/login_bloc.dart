import 'package:demo1/login/domain/bloc/login_event.dart';
import 'package:demo1/login/domain/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../home_page.dart';
import '../../helper/server.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final WebServer webServer = WebServer();
  String mobile = '';
  String password= '';
  LoginBloc():super(LoginInitState()){
    on<LoginMobileEvent>(mobileChange);
    on<LoginPasswordEvent>(passwordChange);
    on<LoginSubmitEvent>(onLoginButtonClickOneMethod);
  }
  onLoginButtonClickOneMethod(LoginSubmitEvent event, emit) {
    emit( LoginLoadingState());
    if (mobile.isEmpty) {
      emit(LoginErrorSate(error: "Please Enter Mobile Number"));
      return;
    }

    if (password.isEmpty) {
      emit(LoginErrorSate(error: "Please Enter Password"));
      return;
    }

   try{
     var response = webServer.loginApi(mobile,password);
     if (response != null) {
       ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
         content: Text("Sign in successfully"),
       ));
       emit( LoginLoadedState());
       Navigator.push(
         event.context,
         MaterialPageRoute(
             builder: (context) => const HomePage()),
       );
     }
   }catch(e){
     ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
       content: Text(emit.toString()),
     ));
    // emit(LoginErrorSate(error: "Username password doesn't matched"));
     emit(LoginErrorSate(error: e.toString()));
   }
  }

  mobileChange(LoginMobileEvent event, emit) {
    mobile = event.mobile;
  }

  passwordChange(LoginPasswordEvent event, emit) {
    password = event.password;
  }
}
