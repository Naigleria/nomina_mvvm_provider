import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:nomina_mvvm_provider/models/nomina.dart';
import 'package:nomina_mvvm_provider/ui/UIHelper.dart';
import 'package:provider/provider.dart';

import '../providers/generalAppInfo.dart';
import '../viewmodels/nomina_description_viewmodel.dart';


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
    final generalAppInfo = Provider.of<GeneralAppInfo>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(56, 91, 216, 1.0),
        ),
      ),
      /*PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child:
        AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: const Text("Descripción de nómina",
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.black
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                nominaDescVM.dowloadNomina(context);
              },
              icon: Icon(Icons.download, color: Colors.black),
            )
          ],
        ),
      ),*/
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
                    Navigator.pushReplacementNamed(context, '/nomina-list');
                  },
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    SvgPicture.asset('assets/svg/exit.svg'),
                    UIHelper.getText("Salir", null, const Color.fromRGBO(0, 41, 89, 1.0),)
                  ],
                ),
                const SizedBox(width: 20.0),
              ],

            ),
            const SizedBox(height: 40.0),
            Row(
              children:  [
                const SizedBox(width: 40.0,),
                UIHelper.getText("Filtro de búsqueda", 19.0, const Color.fromRGBO(0, 41, 89, 1.0),FontWeight.bold)

              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children:  [
                const SizedBox(width: 40.0,),
                Container(
                  height: 40.0,
                  width: 105.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(0, 41, 89, 1.0),
                      width: 1.0
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                    ),
                  ),
                  child: Center(
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UIHelper.getText("Mes", 19.0, const Color.fromRGBO(0, 41, 89, 1.0),FontWeight.bold),
                        const SizedBox(width: 10.0,),
                        const Icon(CupertinoIcons.chevron_down,color: Color.fromRGBO(0, 41, 89, 1.0), )
                      ],
                    ),
                  )
                ),
                SizedBox(width: 10.0,),
                Container(
                  height: 40.0,
                  width: 105.0,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(0, 41, 89, 1.0),
                      width: 1.0
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIHelper.getText("Año", 19.0, const Color.fromRGBO(0, 41, 89, 1.0),FontWeight.bold),
                      const SizedBox(width: 10.0,),
                      const Icon(CupertinoIcons.chevron_down,color: Color.fromRGBO(0, 41, 89, 1.0),)
                    ],
                  )
                ),
              ],
            ),
            const SizedBox(height: 40.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Table(
                border: TableBorder.all(),

                columnWidths: const {
                  1:FractionColumnWidth(0.2),
                  2:FractionColumnWidth(0.5),
                },
                children: [
                  TableRow(
                    children: [
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      )
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      )
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      )
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      ),
                      Container(
                        height: 60.0,
                      )
                    ]
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UIHelper.getElevatedButton("Enviar por correo", 180.0, 50.0,const Color.fromRGBO(146, 146, 146, 1.0),(){

                  },16.0
                ),
                UIHelper.getElevatedButton("Descargar", 120.0, 50.0,const Color.fromRGBO(56, 91, 216, 1.0),(){
                    nominaDescVM.dowloadNomina(context);
                  },16.0
                ),

              ],
            )
            /*
            Expanded(
              child: Container(
                child:PDF().cachedFromUrl(
                  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                  placeholder: (progress) => Center(child: Text('$progress %')),
                  errorWidget: (error) => Center(child: Text(error.toString())),
                )
              )
            )*/

          ]
        ),

      ),
    );
  }




}