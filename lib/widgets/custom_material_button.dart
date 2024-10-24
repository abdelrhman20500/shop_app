import 'package:flutter/material.dart';

MaterialButton CustomMaterialButton({required String text, required void Function()? onPressed}) {
  return MaterialButton(onPressed: onPressed,
    height: 64,
    minWidth: double.infinity,
    color: Colors.blue,
    child:  Text(text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: Colors.white),),);
}