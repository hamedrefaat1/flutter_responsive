import 'package:flutter/material.dart';
import 'package:flutter_responsive/models/place.dart';

class Details extends StatelessWidget {
 Place place ;
   Details({super.key , required this.place});
   
 List<Map> contacts=[
{
  "icon" : Icon(Icons.call , size: 25, color: Colors.blue, ),
  "titel" : "call"
},{
  "icon" : Icon(Icons.send , size: 25, color: Colors.blue, ),
  "titel" : "Route"
}
,{
  "icon" : Icon(Icons.share , size: 25, color: Colors.blue, ),
  "titel" : "Share"
}
 ];
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(place.title),
        centerTitle: true,
      ),
      body:Column(
        children: [
          SizedBox(
            height: height /3 ,
            width: double.infinity,
            child: Image.network(place.image , fit: BoxFit.cover,),
          ),
         // SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(place.title , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(place.subtitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600 , color: Colors.black45))
                  ],
                ),
                Spacer(),
                Icon(Icons.star , color: Colors.blue, size: 20,),
                SizedBox(width: 5,),
                Text("18", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
          )
       
       ,Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(contacts.length,(index){
             return Column(
              children: [
                contacts[index]["icon"],
                SizedBox(height: 5,),
                Text(contacts[index]["titel"] , style:TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w600))
              ],
             );
        }) 
       )
      
      , Padding(padding: EdgeInsets.symmetric( horizontal: 10 , vertical: 20),
      child: Text(place.description , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.w500 , fontSize: 15),),
      )
        ],
      )
    );
  }
}