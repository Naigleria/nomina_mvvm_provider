
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:nomina_mvvm_provider/ui/UIHelper.dart';
import 'package:provider/provider.dart';

import '../providers/generalAppInfo.dart';
import '../viewmodels/nomina_description_viewmodel.dart';
import '../viewmodels/shared_viewmodel.dart';


class NominaDescriptionScreen extends StatefulWidget {
  static String routeName = '/nomina-description';
  // In the constructor, require a nomina.
   const NominaDescriptionScreen({Key? key}) : super(key: key);



  @override
  NominaDescriptionScreenState createState() => NominaDescriptionScreenState();
}


class NominaDescriptionScreenState extends State<NominaDescriptionScreen> {


  @override
  initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    NominaDescriptionViewModel nominaDescVM = Provider.of<NominaDescriptionViewModel>(context);
    SharedViewModel sharedVM =Provider.of<SharedViewModel>(context);
    final generalAppInfo = Provider.of<GeneralAppInfo>(context);
    final dynamic receivedData = ModalRoute.of(context)!.settings.arguments;

    print(receivedData['url_payroll']);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(56, 91, 216, 1.0),
          ),
        ),

        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:
          Column(
            children:[
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  const SizedBox(width: 20.0),
                  InkWell(
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/svg/long_arrow_back.svg'),
                        UIHelper.getText("Regresar", null, const Color.fromRGBO(0, 41, 89, 1.0),)

                      ],
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(child: Container()),
                  InkWell(
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/svg/exit.svg'),
                          UIHelper.getText("Salir", null,  const Color.fromRGBO(0, 41, 89, 1.0))
                        ],
                      ),
                      onTap: ()async{
                        String message = await sharedVM.logout(context);
                        if(message=="Successful Logout"){
                          if(!mounted)return;
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                    ),
                  const SizedBox(width: 20.0),
                ],

              ),
              const SizedBox(height: 40.0),

              Expanded(
                child: Container(
                  child:PDF().cachedFromUrl(
                    receivedData['url_payroll'].toString(),
                    placeholder: (progress) => Center(child: Text('$progress %')),
                    errorWidget: (error) => Center(child: Text(error.toString())),
                  )
                )
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  UIHelper.getElevatedButton("Descargar", 120.0, 50.0,const Color.fromRGBO(56, 91, 216, 1.0),(){
                      nominaDescVM.dowloadNomina(context, receivedData['url_payroll'].toString(),);
                    },16.0
                  ),

                ],
              ),
              const SizedBox(height: 20.0),


            ]
          ),

        ),
      ),
    );
  }




}