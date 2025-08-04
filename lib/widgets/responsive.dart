import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget disktop;
   const Responsive({super.key, required this.mobile,this.tablet, required this.disktop });

 static isMobile(BuildContext context)=> MediaQuery.of(context).size.width <600;

 static isTablet(BuildContext context) => MediaQuery.of(context).size.width <850;

  static isDisktop(BuildContext context) => MediaQuery.of(context).size.width >850;
  @override
 

  Widget build(BuildContext context) {
      if(isMobile(context)){
        return mobile;
      }else if(isTablet(context) && tablet != null){
        return tablet!;
      }else{
        return disktop;
      }
  }
}