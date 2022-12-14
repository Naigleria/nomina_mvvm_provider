import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'dart:async';

import 'package:nomina_mvvm_provider/models/nomina.dart';


class NominaDescriptionScreen extends StatefulWidget {
  static String routeName = '/nomina-description';
  // In the constructor, require a nomina.
  NominaDescriptionScreen({super.key,  this.nomina});

  // Declare a field that holds the Todo.
  Nomina? nomina;

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

    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:
        Column(
          children:[
            Container(
              height: 40.0,
              child: const Center(
                child: Text("Descripción de nómina",
                  style: TextStyle(
                    fontSize: 17.0
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child:PDF().cachedFromUrl(
                  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                  placeholder: (progress) => Center(child: Text('$progress %')),
                  errorWidget: (error) => Center(child: Text(error.toString())),
                )
              )
            )
          ]
        ),

      ),
    );
  }




}