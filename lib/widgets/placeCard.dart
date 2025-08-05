import 'package:flutter/material.dart';
import 'package:flutter_responsive/models/place.dart';
class PlaceCard extends StatelessWidget {
  Place place;
  PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width ;
   //  print(width);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                child: Image.network(
                  place.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
            left: 0,
            right: 0,
              child: Container(
               padding: EdgeInsets.all(width/100),
               color: Colors.black.withOpacity(0.4),height: width /10, width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    place.title,
                    style:  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize:width/35.7
                    ),
                   
                  ),
                  Text(
                    place.subtitle,
                    style:  TextStyle(
                      color: Colors.white70,
                      fontSize:width/35.7
                    ),
                   
                  ),
                ],
              ),
               ),
              
            ),
          ],
        ),
      ),
    );
  }
}
