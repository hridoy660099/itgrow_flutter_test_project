import 'package:flutter/material.dart';

class SizeConfig{
  // screen heigh
  static getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  // screen width
  static getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}