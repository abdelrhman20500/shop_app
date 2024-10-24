
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({super.key,required this.controller, required this.validator,
   required this.labelText,required this.prefixIcon,required this.keyboardType,
     this.suffixIcon,this.onFieldSubmitted,this.obscureText= false});

   TextEditingController controller;
   String? Function(String?)? validator;
   String labelText;
   IconData prefixIcon;
   IconData? suffixIcon;
   TextInputType? keyboardType;
   void Function(String)? onFieldSubmitted;
   bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Colors.grey)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Colors.grey),),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Colors.grey),),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Colors.grey),),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 22),
        prefixIcon: Icon(prefixIcon, size: 30,),
        suffixIcon:Icon(suffixIcon, size: 30,)
      ),
    );
  }
}
