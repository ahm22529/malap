import 'package:flutter/material.dart';
import 'package:malab/component/custom_image_handler.dart';

class ItemPageView extends StatelessWidget{
  const ItemPageView({super.key, required this.titel, required this.sub, required this.image});
final String titel,sub,image;
  @override
  Widget build(BuildContext context) {
   return Column(
    children: [
      CustomImageHandler(image),
      SizedBox(height: 15,),
      Text(titel),
      SizedBox(height: 12,),
      Text(sub)
    ],
   );
  }
}