

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nomina_mvvm_provider/ui/UIHelper.dart';
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(56, 91, 216, 1.0),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Column(
                children:  [
                  UIHelper.getText("Iniciar sesión", 25.0),
                  const SizedBox(height: 20.0),
                  SvgPicture.asset('assets/svg/fingerprint.svg'),
                  const SizedBox(height: 40.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),

                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        filled: true,
                        fillColor:  Color.fromRGBO(223, 230, 232, 1.0),
                        hintText: "E-mail",
                        hintStyle: const TextStyle(
                          fontSize: 16,
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        filled: true,
                        fillColor: Color.fromRGBO(223, 230, 232, 1.0),
                        hintText: "Contraseña",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: IconButton(
                          iconSize: 40.0,
                          icon: loginVM.passwordVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                            onPressed: (){
                              loginVM.changePassVisibility();
                            }
                        )
                      ),
                      obscureText: loginVM.passwordVisible
                        ? false
                        : true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value){
                        //loginVM.login();
                        Navigator.pushReplacementNamed(context, '/nomina-list');
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      UIHelper.getText("Recuperar contraseña", 15.0, Colors.black54),
                      const SizedBox(width: 20.0,)
                    ],
                  ),
                  const SizedBox(height: 40.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: UIHelper.getElevatedButton("Entrar", double.infinity, 60.0, Color.fromRGBO(56, 91, 216, 1.0), () {
                      //loginVM.login();
                      Navigator.pushReplacementNamed(context, '/nomina-list');
                    }, 20.0
                    )

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }




}