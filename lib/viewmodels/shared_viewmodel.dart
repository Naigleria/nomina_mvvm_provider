
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:nomina_mvvm_provider/services/shared_webservice.dart';
import 'package:nomina_mvvm_provider/ui/UIHelper.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class SharedViewModel extends ChangeNotifier {




  Future<String> logout(BuildContext context)async{
    final ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.normal, isDismissible: false);
    final snackBar = UIHelper.getSnackBar("Sesión cerrada!", "Sesión cerrada con exito", ContentType.success);
    pr.style(message: "Cerrando sesión...");
    await pr.show();

    try{
      final data = await SharedWebService().logout();
      await pr.hide();
      if(data["message"]=="Successful Logout"){


        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);

      }
      return data["message"];
    }catch(e){
      await pr.hide();
      return "Error";
    }
     /* ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);*/

  }
}

