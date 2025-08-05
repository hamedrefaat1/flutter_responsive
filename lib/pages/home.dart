// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/places.dart';
import 'package:flutter_responsive/models/place.dart';
import 'package:flutter_responsive/widgets/placeCard.dart';
import 'package:flutter_responsive/widgets/responsive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: bulidForMobile(),
      tablet: bulidForTap(),
      disktop: bulidForDisktop(),
    );
  }
}

Widget bulidForMobile() {
  return Scaffold(
    backgroundColor: Colors.black.withOpacity(0.25),
    appBar: AppBar(
      title: Text("Exploer Egypt"),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    ),

    drawer: Drawer(
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
    ),
    body: Padding(
      padding: EdgeInsets.all(12),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.8,

        children: allPlaces.map((place) => PlaceCard(place: place)).toList(),
      ),
    ),
  );
}

Widget bulidForTap() {
  return Scaffold(
    body: Container(
      color: Colors.orange,
      child: Center(child: Text("For Tablet")),
    ),
  );
}

Widget bulidForDisktop() {
  return Scaffold(
    body: Container(
      color: Colors.green,
      child: Center(child: Text("For Desktop")),
    ),
  );
}
