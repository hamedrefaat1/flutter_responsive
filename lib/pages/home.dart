import 'package:flutter/material.dart';
import 'package:flutter_responsive/widgets/responsive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(mobile: bulidForMobile(),tablet: bulidForTap(), disktop: bulidForDisktop()),
    );
  }
}

Widget bulidForMobile(){
  return Container(
    color: Colors.red,
   child: Center(child: Text("For Mobile"),),
  );
}

Widget bulidForTap(){
  return Container(
    color: Colors.orange,
   child: Center(child: Text("For Tablet"),),
  );
}

Widget bulidForDisktop(){
  return Container(
    color: Colors.green,
   child: Center(child: Text("For Desktop"),),
  );
}