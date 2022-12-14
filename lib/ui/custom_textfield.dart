import 'package:flutter/material.dart';

class CustomTextField {



  static textfield(BuildContext context, TextEditingController controller, String hintText, bool isPassword, [var viewmodel]){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Color.fromARGB(255, 210, 210, 211),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

      ),
      textInputAction: TextInputAction.next,
      onSubmitted: (value){
        if(isPassword){
          //viewmodel.doLoginApi( );
        }else{
          print(isPassword);
          FocusScope.of(context).nextFocus();
        }
      },
    );
  }
}