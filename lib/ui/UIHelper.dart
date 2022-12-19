




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

  static ConstrainedBox getElevatedButton(String text, double width , double height, Color color, VoidCallback? onPressed, [double? fontSizeText, Color? colorText, FontWeight? fontWeightText]){
    return ConstrainedBox(
      constraints:  BoxConstraints.tightFor(width: width, height: height),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),

        ),
        onPressed: onPressed,
        child: getText(text, fontSizeText, colorText, fontWeightText),
      ),
    );
  }

  static Text getText(String text, [double? fontSize, Color? color, FontWeight? fontWeight]){
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight
      ),
    );
  }
}