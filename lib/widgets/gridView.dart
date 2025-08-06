import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/places.dart';
import 'package:flutter_responsive/models/place.dart';
import 'package:flutter_responsive/widgets/placeCard.dart';

class Gridview extends StatelessWidget {
  int crossAxisCount;
  Axis decoration;
  void Function(Place)? updatePlace;
   Gridview({super.key , required this.crossAxisCount , required this.decoration , this.updatePlace});

  @override
  Widget build(BuildContext context) { 
    return GridView.count(
      scrollDirection: decoration,
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.8,

        children: allPlaces.map((place) => PlaceCard(place: place , updatePlace: updatePlace,)).toList(),
      );
  }
}