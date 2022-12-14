import 'package:flutter/material.dart';
import 'dart:async';

import 'nomina_description_screen.dart';


class NominaListScreen extends StatefulWidget {
  static String routeName = '/nomina-list';
  const NominaListScreen({Key? key}) : super(key: key);

  @override
  NominaListScreenState createState() => NominaListScreenState();
}


class NominaListScreenState extends State<NominaListScreen> {


  @override
  initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:
          Column(
            children:[
              Container(
                height: 40.0,
                child: const Center(
                  child: Text("Lista de nóminas con filtros",
                    style: TextStyle(
                      fontSize: 17.0
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: InkWell(
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0)
                            )
                          ),
                          child: const Center(
                            child: Text("Nómina",
                              style: TextStyle(
                                fontSize: 17.0
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NominaDescriptionScreen(nomina: null),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ]
          ),

        ),
      ),
    );
  }




}