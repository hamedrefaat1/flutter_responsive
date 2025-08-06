

import 'package:flutter/material.dart';
import 'package:flutter_responsive/models/place.dart';
import 'package:flutter_responsive/pages/details.dart';
import 'package:flutter_responsive/widgets/responsive.dart';
class PlaceCard extends StatelessWidget {
  Place place;
  void Function(Place)? updatePlace ;
  PlaceCard({super.key, required this.place , this.updatePlace});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width > 600 && width < 850){
     width=  width/1.5;
    }else if (width <600) {
      width = width;
    }else{
      width = width/2.7;
    }
    
   //  print(width);
    return GestureDetector(
      onTap: (){
        final isMobile = Responsive.isMobile(context);
        final isTablet = Responsive.isTablet(context);
       if(isMobile || isTablet) {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> Details(place: place)));
       }else{
           updatePlace!(place);
       }

      },
      child: Card(
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
                 color: Colors.black.withOpacity(0.4),height: width /9.5, width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      place.title,
                      style:  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:width/35.7
                      ),
                     
                    ),
                    Text(
                         maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
