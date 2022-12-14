

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import '../providers/generalAppInfo.dart';
import '../viewmodels/login_viewmodel.dart';


class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}


class LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    LoginViewModel loginVM = Provider.of<LoginViewModel>(context);
    final generalAppInfo = Provider.of<GeneralAppInfo>(context);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Column(
                children:  [
                  const Text("Login",
                    style: TextStyle(
                      fontSize: 17.0
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        filled: true,
                        fillColor: Color.fromARGB(255, 210, 210, 211),
                        hintText: "Usuario",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                      textInputAction: TextInputAction.next,

                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        filled: true,
                        fillColor: Color.fromARGB(255, 210, 210, 211),
                        hintText: "Contraseña",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value){
                        //loginVM.doLoginApi();
                        Navigator.pushReplacementNamed(context, '/nomina-list');
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text("¿Olvidaste la contraseña?",
                    style: TextStyle(
                      fontSize: 17.0
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }




}