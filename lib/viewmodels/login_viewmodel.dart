import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomina_mvvm_provider/services/login_webservice.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/UIHelper.dart';

class LoginViewModel extends ChangeNotifier {

  bool passwordVisible=false;
  bool pass1Visible=false;
  bool pass2Visible=false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController recoverPassEmailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final TextEditingController pass1Controller = TextEditingController();
  final TextEditingController pass2Controller = TextEditingController();

  void changePassVisibility(){
    passwordVisible=!passwordVisible;
    notifyListeners();
  }
  void changePass1Visibility(){
    pass1Visible=!pass1Visible;
    print(pass1Visible);
    notifyListeners();
  }
  void changePass2Visibility(){
    pass2Visible=!pass2Visible;
    notifyListeners();
  }

  Future<String> login(BuildContext context, String username, String password ) async {

    final ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.normal, isDismissible: false);

    if(username=="" || password==""){
      final snackBar = UIHelper.getSnackBar("Error!", "Correo y contraseña son campos requeridos", ContentType.failure);

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);


      return "email or password empty";
    }
    else{
      pr.style(message: "Iniciando sesión...");
      await pr.show();

      try{
        final data = await LoginWebservice().loginApi(username, password);
        await pr.hide();

        if(data["message"]=="invalid credentials"){
          final snackBar = UIHelper.getSnackBar("Credenciales inválidas!", "Correo o contraseña incorrectos", ContentType.failure);

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);

        }
        return data["message"];
      }catch(e){

        await pr.hide();
        print(e);
        return "error";
        print("Error de LoginViewModel");
      }
    }


    //print(username +" ! "+ password);
    //print(data["message"]);
    //return "";
    /*if( ){

      await pr.hide();
      return "Successful login";
    }else{
      await pr.hide();
      final snackBar = UIHelper.getSnackBar("Error!", " Credenciales invalidas", ContentType.failure);

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      return "invalid credentials";
    }*/

  }

  Future<void> sendCodeToEmail(BuildContext context, String email)async{
    final ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.normal, isDismissible: false);
    pr.style(message: "Enviando código de verificación...");
    //await pr.show();

    try{
      final data = await LoginWebservice().sendCodeToEmailApi(email);
      //Future.delayed(const Duration(seconds: 2));
      //await pr.hide();
      print(data["Message"]);
      //final snackBar = UIHelper.getSnackBar("Código enviado!", "El código de verificación ha sido enviado a tu correo", ContentType.success);

      //ScaffoldMessenger.of(context)
      //  ..hideCurrentSnackBar()
      //  ..showSnackBar(snackBar);



    }catch(e){

    }
  }

  Future<void> validateCode(BuildContext context, String code)async{
    final ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.normal, isDismissible: false);
    pr.style(message: "Enviando código de verificación...");
    //await pr.show();

    try{
      final data = await LoginWebservice().validateCodeApi(code);
      final prefs = await SharedPreferences.getInstance();


      await prefs.setInt('user_id', data['Entity']['user']);
      //Future.delayed(const Duration(seconds: 2));
      //await pr.hide();

      print("Validated: ${data["Validated"]}");
      //final snackBar = UIHelper.getSnackBar("Código enviado!", "El código de verificación ha sido enviado a tu correo", ContentType.success);

      //ScaffoldMessenger.of(context)
      //  ..hideCurrentSnackBar()
      //  ..showSnackBar(snackBar);



    }catch(e){
      print(e);
    }

  }

  Future<void> restorePassword(BuildContext context, String password)async{
    final ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.normal, isDismissible: false);
    pr.style(message: "Enviando código de verificación...");
    //await pr.show();

    try{
      final prefs = await SharedPreferences.getInstance();
      String userId=prefs.getInt('user_id').toString();
      final data = await LoginWebservice().restorePasswordApi(password, userId);




      //Future.delayed(const Duration(seconds: 2));
      //await pr.hide();

      print(data["Message"]);
      //final snackBar = UIHelper.getSnackBar("Código enviado!", "El código de verificación ha sido enviado a tu correo", ContentType.success);

      //ScaffoldMessenger.of(context)
      //  ..hideCurrentSnackBar()
      //  ..showSnackBar(snackBar);



    }catch(e){
      print(e);
    }

  }






}
