import 'package:firetasks/ui/general/colors.dart';
import 'package:flutter/material.dart';

class ItemCategoriaWidget extends StatelessWidget {
  String text;
  ItemCategoriaWidget({required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding:const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.5),
                decoration: BoxDecoration(
                  color: categoryColor[text],
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child:Text(text,style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),) ,);
  }
}