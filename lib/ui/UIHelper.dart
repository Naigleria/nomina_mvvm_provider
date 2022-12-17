




import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class UIHelper {

  static SnackBar getSnackBar(String title, String message, ContentType contentType){
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message:message,
        contentType: contentType
      ),
    );
  }

  static ElevatedButton getElevatedButton(String text, VoidCallback onPressed){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}