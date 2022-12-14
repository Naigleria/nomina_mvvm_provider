import 'package:flutter/material.dart';
import 'package:nomina_mvvm_provider/screens/login_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes(var optionalData){
  return  <String, WidgetBuilder>{
    'login'                    : (BuildContext context) => LoginScreen(),
  };
}