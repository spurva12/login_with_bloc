import 'dart:convert';

import '../domain/Models/login_model.dart';
import 'package:http/http.dart' as http;

class WebServer{


  Future<LoginModel?>  loginApi(String mobile, String password) async{
    String loginUrl = "http://setrans.businesstowork.com/setrans/api/v1/auth";
    var data = {'mobile': mobile, 'password' : password};
    try{
      var res  = await http.post(Uri.parse(loginUrl), body: data);
      print("res--->${res.body}");
      if(res.statusCode == 200){
        LoginModel loginModel = LoginModel.fromJson(jsonDecode(res.body));
        return loginModel;
      } else{
        return null;
      }
    }catch(e){
      print(e.toString());
    }
    return null;


  }
}