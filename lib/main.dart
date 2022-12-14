
import 'package:flutter/material.dart';
import 'package:nomina_mvvm_provider/routes/routes.dart';
import 'package:nomina_mvvm_provider/screens/nomina_description_screen.dart';
import 'package:nomina_mvvm_provider/screens/nomina_list_screen.dart';
import 'package:nomina_mvvm_provider/viewmodels/nomina_description_viewmodel.dart';
import 'package:nomina_mvvm_provider/viewmodels/nomina_list_viewmodel.dart';
import 'package:provider/provider.dart';

import 'providers/generalAppInfo.dart';
import 'screens/login_screen.dart';
import 'viewmodels/login_viewmodel.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>GeneralAppInfo()),
      ],
      child: MaterialApp(
        title: "Movies",
        debugShowCheckedModeBanner: false,
        home:
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
          child: const LoginScreen(),

        ),
        routes:
        {
          LoginScreen.routeName:(context) => LoginScreen(),
          //NominaDescriptionScreen.routeName:(context) => NominaDescriptionScreen(nomina: null,),
          NominaListScreen.routeName:(context) => NominaListScreen()
        },
      ),
    );
  }

}