
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nomina_mvvm_provider/routes/routes.dart';
import 'package:nomina_mvvm_provider/screens/nomina_description_screen.dart';
import 'package:nomina_mvvm_provider/screens/nomina_list_screen.dart';
import 'package:nomina_mvvm_provider/viewmodels/nomina_description_viewmodel.dart';
import 'package:nomina_mvvm_provider/viewmodels/nomina_list_viewmodel.dart';

import 'package:provider/provider.dart';

import 'providers/generalAppInfo.dart';
import 'screens/login_screen.dart';
import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/shared_viewmodel.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        //hay que registrar todos los viewmodels por que sino truena cuando se quieran
        //instanciar en el Widget Build de las screens
        ChangeNotifierProvider(create: (context) =>GeneralAppInfo()),
        ChangeNotifierProvider(create:(context)=>SharedViewModel()),
        ChangeNotifierProvider(create: (context) =>NominaListViewModel()),
        ChangeNotifierProvider(create: (context) =>NominaDescriptionViewModel()),
        ChangeNotifierProvider(create: (context) =>LoginViewModel()),
      ],
      child: MaterialApp(
        title: "Movies",
        debugShowCheckedModeBanner: false,
       /* home:
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
          child: const LoginScreen(),

        ),*/
        initialRoute: '/login',
        routes:
        {

          LoginScreen.routeName:(context) => LoginScreen(),
          NominaDescriptionScreen.routeName:(context) => NominaDescriptionScreen(),
          NominaListScreen.routeName:(context) => NominaListScreen()
        },
      ),
    );
  }

}