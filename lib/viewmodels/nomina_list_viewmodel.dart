import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:nomina_mvvm_provider/models/nomina.dart';
import 'package:nomina_mvvm_provider/services/nomina_list_webservice.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tuple/tuple.dart';

import '../ui/UIHelper.dart';

class NominaListViewModel extends ChangeNotifier {

  List<Nomina> nominas = <Nomina>[];
  bool isLoading=true;


  void activateCheckBox (int checkIndex){
    for (int i=0; i<nominas.length; i++){
      if(i==checkIndex){
        nominas[i].boolCheckBox=true;
      }else{
        nominas[i].boolCheckBox=false;
      }
    }
    notifyListeners();
  }

  Future<void> fetchNominas( ) async {
    //isLoading=true;

    try{
      print("primer fetch");
      final Tuple2 tuple = await NominaListWebservice().fetchNominasListApi();
      print("final primer fetch");

      if(tuple.item2==200){
        nominas=tuple.item1.map<Nomina>((json) => Nomina.fromJson(json)).toList();
        //_reclamations = parsed.map<Reclamation>((json) => Reclamation.fromJson(json)).toList();
        nominas[0].boolCheckBox=true;
        isLoading=false;
        notifyListeners();
      }


    }catch(e){
      print("loginViewModel Exception: $e");
    }

  }

  void datePickerCupertino(BuildContext context, String dateFormat){
    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.utc(2010),
      maxDateTime: DateTime(DateTime.now().year,DateTime.now().month),
      initialDateTime: DateTime(DateTime.now().year,DateTime.now().month),
      //estaba originalmente en 'dd-MMMM-yyyy'
      //esta libreria si te deja poner los 3 formatos:
      //dia-mes-año ('dd-MMMM-yyyy'), solamente mes y año ('MMMM-yyyy'), o solamente año ('yyyy')
      dateFormat:dateFormat,
      locale: DateTimePickerLocale.es,
      onConfirm:  (DateTime cachedDate, List<int> listaOk){

      }
    );
  }




}