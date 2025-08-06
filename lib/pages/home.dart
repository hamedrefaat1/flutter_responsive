// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/places.dart';
import 'package:flutter_responsive/models/place.dart';
import 'package:flutter_responsive/pages/details.dart';
import 'package:flutter_responsive/widgets/customDrawer.dart';
import 'package:flutter_responsive/widgets/gridView.dart';
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

    drawer: Customdrawer(),
    body: Padding(
      padding: EdgeInsets.all(12),
      child: Gridview(crossAxisCount: 2, decoration: Axis.vertical),
    ),
  );
}

Widget bulidForTap() {
  return Scaffold(
    appBar: AppBar(title: Text("Exploer Egypt")),
    body: Row(
      children: [
        Expanded(flex: 3, child: Customdrawer()),
        Expanded(
          flex: 5,
          child: Gridview(crossAxisCount: 2, decoration: Axis.vertical),
        ),
      ],
    ),
  );
}

Widget bulidForDisktop() {
  return LayoutDesktop();
}

class LayoutDesktop extends StatefulWidget {
  const LayoutDesktop({super.key});

  @override
  State<LayoutDesktop> createState() => _LayoutDesktopState();
}

class _LayoutDesktopState extends State<LayoutDesktop> {
  late Place selectedPlace;
  void updatePlace(Place place) {
    setState(() {
      selectedPlace = place;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedPlace = allPlaces[0];
    super.initState();
  }

  List<Map> contacts = [
    {"icon": Icon(Icons.call, size: 25, color: Colors.blue), "titel": "call"},
    {"icon": Icon(Icons.send, size: 25, color: Colors.blue), "titel": "Route"},
    {"icon": Icon(Icons.share, size: 25, color: Colors.blue), "titel": "Share"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exploer Egypt")),
      body: Row(
        children: [
          Expanded(flex: 2, child: Customdrawer()),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Gridview(
                      crossAxisCount: 1,
                      decoration: Axis.horizontal,
                      updatePlace: updatePlace,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(
                      builder: (context, constrains) {
                        double highet = constrains.maxHeight;
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 65,
                            right: 0,
                            left: 0,
                          ),
                          child: Container(
                            color: Colors.white,
                            height: highet / 4,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                       f
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                     
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          selectedPlace.image,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height /
                                              2.8,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                    
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                        
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    selectedPlace.title,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    selectedPlace.subtitle,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.star,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "18",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 20),

                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                       
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: List.generate(
                                            contacts.length,
                                            (index) {
                                              return Column(
                                                children: [
                                                  contacts[index]["icon"],
                                                  SizedBox(height: 5),
                                                  Text(
                                                    contacts[index]["titel"],
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 30),

                                        
                                        Text(
                                          selectedPlace.description,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
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
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
