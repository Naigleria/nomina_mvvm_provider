import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nomina_mvvm_provider/viewmodels/nomina_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:custom_check_box/custom_check_box.dart';

import '../providers/generalAppInfo.dart';
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
    //cuando se traiga la lista de nominas se setea el primer checkbox como activo
    //Provider.of<NominaListViewModel>(context, listen: false).activateCheckBox(0);
  }


  @override
  Widget build(BuildContext context) {

    NominaListViewModel nominaListVM = Provider.of<NominaListViewModel>(context);
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:
          Column(
            children: [
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  const SizedBox(width: 20.0),
                  InkWell(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/long_arrow_back.svg'
                        ),
                        const Text("Regresar",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 41, 89, 1.0),
                          ),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/exit.svg'
                      ),
                      const Text("Salir",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 41, 89, 1.0),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 20.0),
                ],

              ),
              const SizedBox(height: 40.0),
              Row(
                children: const [
                  SizedBox(width: 40.0,),
                  Text("Filtro de búsqueda",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 41, 89, 1.0),
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold
                    )
                  )
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
                          Text("Mes",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 41, 89, 1.0),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Icon(CupertinoIcons.chevron_down,
                            color: Color.fromRGBO(0, 41, 89, 1.0),
                          )
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
                        Text("Año",
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 41, 89, 1.0),
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Icon(CupertinoIcons.chevron_down,
                          color: Color.fromRGBO(0, 41, 89, 1.0),
                        )
                      ],
                    )
                  ),
                ],
              ),
              SizedBox(height: 40.0,),
              Row(
                children: [
                  SizedBox(width: 80.0,),
                  Container(
                    height: 40.0,
                    width: 90.0,
                    color: Colors.black,
                    child: Center(
                      child: Text("Text",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),

                  ),
                  Container(
                    height: 40.0,
                    width: 60.0,
                    color: Colors.black,
                    child: Center(
                      child: Text("No.",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),

                  ),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      color: Colors.black,
                      child: Center(
                        child: Text("Descripción",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,)
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: nominaListVM.nominasLength,
                itemBuilder: (context, index){
                  //se tiene que tener acceso a los demas booleanos para setearlos en false
                  //bool checkIndex =false;
                  return Row(
                    children: [
                      const SizedBox(width: 30.0,),
                      GFCheckbox(
                        size: GFSize.SMALL,
                        activeBgColor: Colors.black,
                        type: GFCheckboxType.square,
                        inactiveBorderColor: Color.fromRGBO(56, 91, 216, 1.0),
                        activeBorderColor: Color.fromRGBO(56, 91, 216, 1.0),
                        onChanged: (value) {
                          nominaListVM.activateCheckBox(index);
                        },
                        value: nominaListVM.boolsCheckBox[index],
                      ),
                      Container(
                        height: 50.0,
                        width: 90.0,
                        child: Center(
                          child: Text("Text")
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.black,
                              width: 1.0
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1.0
                            ),
                          )
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 60.0,
                        child: Center(
                          child: Text("Text"),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.black,
                              width: 1.0
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1.0
                            ),
                          )
                        ),

                      ),
                      Expanded(
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text("Text"),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.black,
                                width: 1.0
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1.0
                              ),
                              right: BorderSide(
                                color: Colors.black,
                                width: 1.0
                              ),
                            )
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0,)
                    ],
                  );
                },

              ),
              SizedBox(height: 100.0),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 120.0, height: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(56, 91, 216, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/nomina-description');
                  },
                  child: const Text("Ver",
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  )
                ),
              ),

            ]
          ),

        ),
      ),
    );
  }




}