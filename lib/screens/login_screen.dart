


import 'package:email_validator/email_validator.dart';
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


  @override
  initState() {
    Provider.of<LoginViewModel>(context, listen: false).usernameController.clear();
    Provider.of<LoginViewModel>(context, listen: false).passwordController.clear();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    LoginViewModel loginVM = Provider.of<LoginViewModel>(context);
    final generalAppInfo = Provider.of<GeneralAppInfo>(context);

    print("Widget Build");
    //loginVM.usernameController.clear();
    //loginVM.passwordController.clear();

    Future<void> showDialogRestorePassword(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reestablecer contraseña'),
          content:Consumer<LoginViewModel>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: ListBody(
                  children:  <Widget>[
                    const Text('Introduce tu nueva contraseña:'),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: value.pass1Controller,

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
                        hintText: "Contraseña",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: IconButton(
                          iconSize: 40.0,
                          icon: value.pass1Visible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                            onPressed: (){
                              value.changePass1Visibility();
                            }
                        )
                      ),
                      obscureText: value.pass1Visible
                        ? false
                        : true,
                    ),
                    const SizedBox(height: 10.0,),
                    TextField(
                      controller: value.pass2Controller,

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
                        hintText: "Confirmar contraseña",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: IconButton(
                          iconSize: 40.0,
                          icon: value.pass2Visible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                          onPressed: (){
                            value.changePass2Visibility();
                          }
                        )

                      ),
                      obscureText: value.pass2Visible
                        ? false
                        : true,

                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        TextButton(
                          child: const Text('Reestablecer contraseña'),
                          onPressed: () {
                            loginVM.restorePassword(context,value.pass2Controller.text);
                            Navigator.of(context).pop();
                          },
                        ),

                      ],
                    )
                  ],
                ),
              );

            },
          ),


          actions: <Widget>[

          ],
        );
      },
    );
  }

    Future<void> showDialogPutCode(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Introduce código'),
            content: SingleChildScrollView(
              child: ListBody(
                children:  <Widget>[
                  const Text('Introduce el código que se envió a tu correo para reestablecer la contraseña:'),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: loginVM.codeController,

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
                      hintText: "Código de verificación",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),

                    ),

                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Validar código de verificación'),
                onPressed: () {

                  Navigator.of(context).pop();
                  loginVM.validateCode(context, loginVM.codeController.text);
                  showDialogRestorePassword(context);
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> showDialogRecoverPass(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Reestablecer contraseña'),
            content: SingleChildScrollView(
              child: ListBody(
                children:  <Widget>[
                  const Text('Introduce tu correo para reestablecer la contraseña:'),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: loginVM.recoverPassEmailController,

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

                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Enviar código de verificación'),
                onPressed: ()async {
                  if(EmailValidator.validate(loginVM.recoverPassEmailController.text)){
                    Navigator.of(context).pop();
                    loginVM.sendCodeToEmail(context,loginVM.recoverPassEmailController.text);
                    showDialogPutCode(context);
                    //lo mandamos a la pantalla donde introduzca el codigo que se le envió al correo
                  }

                },
              ),
            ],
          );
        },
      );
    }



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
                      controller: loginVM.usernameController,
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
                      controller: loginVM.passwordController,
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
                              //loginVM.changePassVisibility();
                              print(loginVM.passwordController.text);
                              setState(() {
                                loginVM.passwordVisible=!loginVM.passwordVisible;
                              });
                            }
                        )
                      ),
                      obscureText: loginVM.passwordVisible
                        ? false
                        : true,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value)async{
                        String message = await loginVM.login(context, loginVM.usernameController.text, loginVM.passwordController.text) ;
                        print(message);
                        if(message=="Successful login"){
                          if(!mounted)return;
                          Navigator.pushReplacementNamed(context, '/nomina-list');
                        }
                      },
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(child: Container()),
                      TextButton(
                        onPressed: (){
                          showDialogRecoverPass(context);
                        },
                        child: UIHelper.getText("Reestablecer contraseña", 15.0, Colors.black54),
                      ),
                      const SizedBox(width: 20.0,)
                    ],
                  ),
                  const SizedBox(height: 40.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: UIHelper.getElevatedButton("Entrar", double.infinity, 60.0, Color.fromRGBO(56, 91, 216, 1.0), () async{
                      String message = await loginVM.login(context, loginVM.usernameController.text, loginVM.passwordController.text) ;
                      print(message);
                      if(message=="Successful login"){
                        if(!mounted)return;
                        Navigator.pushReplacementNamed(context, '/nomina-list');
                      }
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