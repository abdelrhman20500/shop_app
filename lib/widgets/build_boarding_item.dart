import 'package:flutter/material.dart';
import '../models/boarding/boarding_model.dart';

Widget buildBoardingItem(BoardingModel model) {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage(model.image))),
      // const SizedBox(height: 30.0,),
      Text(model.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      const SizedBox(height: 15.0,),
      Text(model.body, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    ],
  );
}
