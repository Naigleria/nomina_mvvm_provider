import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomina_mvvm_provider/services/login_webservice.dart';

class LoginViewModel extends ChangeNotifier {

  bool passwordVisible=false;

  void changePassVisibility(){
    passwordVisible=!passwordVisible;
    notifyListeners();
  }


  void login( ) async {

    final data = await LoginWebservice().loginApi();


  }



}
