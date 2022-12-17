import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomina_mvvm_provider/models/nomina.dart';

class NominaListViewModel extends ChangeNotifier {

  List<Nomina> nominas = <Nomina>[];
  int nominasLength=4;
  List<bool> boolsCheckBox= [true, false, false, false,];

  void activateCheckBox (int checkIndex){
    for (int i=0; i<boolsCheckBox.length; i++){
      if(i==checkIndex){
        boolsCheckBox[i]=true;
      }else{
        boolsCheckBox[i]=false;
      }
    }
    notifyListeners();
  }

  Future<void> fetchNominas( ) async {




  }



}