import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nomina_mvvm_provider/ui/UIHelper.dart';
import 'package:nomina_mvvm_provider/viewmodels/nomina_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../providers/generalAppInfo.dart';
import '../viewmodels/shared_viewmodel.dart';
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
    Provider.of<NominaListViewModel>(context, listen: false).fetchNominas();
  }


  @override
  Widget build(BuildContext context) {

    NominaListViewModel nominaListVM = Provider.of<NominaListViewModel>(context);
    SharedViewModel sharedVM= Provider.of<SharedViewModel>(context);
    final generalAppInfo = Provider.of<GeneralAppInfo>(context);



    return nominaListVM.isLoading?
    WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(56, 91, 216, 1.0),
          ),
        ),
        body:SafeArea(
          top: true,
          child: Container(
            color: Colors.black12,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        )
      ),
    ):
    WillPopScope(
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20.0,),
                Row(
                  children: [
                    const SizedBox(width: 20.0),
                    InkWell(
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/svg/long_arrow_back.svg'),
                          UIHelper.getText("Regresar", null,  const Color.fromRGBO(0, 41, 89, 1.0))
                        ],
                      ),
                      onTap: (){
                        Navigator.pushReplacementNamed(context, '/login');
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
                Row(
                  children:  [
                    const SizedBox(width: 40.0,),
                    UIHelper.getText("Filtro de búsqueda", 19.0, const Color.fromRGBO(0, 41, 89, 1.0), FontWeight.bold)
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children:  [
                    const SizedBox(width: 40.0,),
                    InkWell(
                      child: Container(
                        height: 40.0,
                        width: 105.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(0, 41, 89, 1.0),
                            width: 1.0
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0)
                          ),
                        ),
                        child: Center(
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UIHelper.getText("Mes", 19.0, const Color.fromRGBO(0, 41, 89, 1.0), FontWeight.bold),
                              const SizedBox(width: 10.0,),
                              const Icon(CupertinoIcons.chevron_down, color: Color.fromRGBO(0, 41, 89, 1.0))
                            ],
                          ),
                        )
                      ),
                      onTap:(){
                        nominaListVM.datePickerCupertino(context, 'MMMM');
                      }
                    ),
                    const SizedBox(width: 10.0,),
                    InkWell(
                      child: Container(
                        height: 40.0,
                        width: 105.0,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(0, 41, 89, 1.0),
                            width: 1.0
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0)
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UIHelper.getText("Año", 19.0, const Color.fromRGBO(0, 41, 89, 1.0), FontWeight.bold),
                            const SizedBox(width: 10.0,),
                            const Icon(CupertinoIcons.chevron_down,color: Color.fromRGBO(0, 41, 89, 1.0) )
                          ],
                        )
                      ),
                      onTap: (){
                        nominaListVM.datePickerCupertino(context, 'yyyy');
                      }
                    ),
                  ],
                ),
                const SizedBox(height: 40.0,),
                Row(
                  children: [
                    const SizedBox(width: 80.0,),
                    /*
                    Container(
                      height: 40.0,
                      width: 90.0,
                      color: Colors.black,
                      child:  Center(
                        child: UIHelper.getText("Text", null, Colors.white)
                      ),

                    ),
                    Container(
                      height: 40.0,
                      width: 60.0,
                      color: Colors.black,
                      child:  Center(
                        child: UIHelper.getText("No.", null, Colors.white)
                      ),

                    ),
                    */
                    Expanded(
                      child: Container(
                        height: 40.0,
                        color: Colors.black,
                        child:  Center(
                        child: UIHelper.getText("Fecha de pago", null, Colors.white)
                      ),
                      ),
                    ),
                    const SizedBox(width: 20.0,)
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: nominaListVM.nominas.length,
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
                          inactiveBorderColor: const Color.fromRGBO(56, 91, 216, 1.0),
                          activeBorderColor: const Color.fromRGBO(56, 91, 216, 1.0),
                          onChanged: (value) {
                            nominaListVM.activateCheckBox(index);
                          },
                          value: nominaListVM.nominas[index].boolCheckBox,
                        ),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            decoration: const BoxDecoration(
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
                            child:  Center(
                              child: Text(
                                nominaListVM.nominas[index].paymentDate.toString().substring(0,11)
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0,)
                      ],
                    );
                  },

                ),
                const SizedBox(height: 100.0),
                UIHelper.getElevatedButton("Ver", 120.0, 50.0,const Color.fromRGBO(56, 91, 216, 1.0),(){

                    nominaListVM.nominas.forEach((nomina) {
                      if(nomina.boolCheckBox){
                        Navigator.pushNamed(context, '/nomina-description',
                          arguments: {
                            "url_payroll": nomina.urlPayroll
                          }
                        );
                      }

                    });

                  },20.0
                ),


              ]
            ),
          ),

        ),
      ),
    );
  }




}