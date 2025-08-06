import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/places.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
            child: Text("Side menu", style: TextStyle(color: Colors.white)),
          ),
        ...List.generate(allStates.length, (index){
         return ListTile(title: Text(allStates[index]),);
        })
          
       
        ],
      ),
    );
  }
}