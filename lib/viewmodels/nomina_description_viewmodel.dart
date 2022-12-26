import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomina_mvvm_provider/ui/UIHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../services/nomina_description_webservice.dart';

class NominaDescriptionViewModel extends ChangeNotifier {



  Future<void> dowloadNomina(BuildContext context, String urlPayroll ) async {

    final ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.normal, isDismissible: false);
    pr.style(message: "Descargando nomina...");

    final status = await Permission.storage.request();

    if (status.isGranted) {
    //permisos concedidos, se hace la descarga del pdf
    Directory? directory;
    urlPayroll=urlPayroll.replaceAll("//", "/");
    List urlParts = urlPayroll.split('/');

    urlParts.removeAt(0);
    //urlParts.removeAt(1);

    String baseUrl =urlParts[0];
    String urlPath="";
    urlParts.removeAt(0);
    for (var element in urlParts) {
      urlPath+="/$element";
    }
    String fileName =urlParts.last;

    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {

        directory = Directory('/storage/emulated/0/Download');
        String fileExist='${directory.path}/$fileName';

        if(await File(fileExist).exists()){
          final snackBarExist = UIHelper.getSnackBar("Atención!", "  Este pdf ya existe en tu carpeta de 'Descargas'", ContentType.warning);

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBarExist);
        }else{
          await pr.show();
          final response = await NominaDescWebservice().dowloadNominaApi(baseUrl, urlPath);
          File file= File("${directory.path}/$fileName");
          await file.writeAsBytes(response.bodyBytes, flush: true);
          await pr.hide();

          final snackBar = UIHelper.getSnackBar("Bien!", "  Pdf guardado  exitosamente en tu carpeta de 'Descargas'", ContentType.success);

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }

      }
    } catch (err, stack) {
      await pr.hide();
      print("Cannot get download folder path");
    }



  } else {
    // permisos no concedidos
  }

    //await pr.show();
    //await Future.delayed(const Duration(seconds: 2));


    //await pr.hide();
  }



}