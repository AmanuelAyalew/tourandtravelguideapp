import 'package:flutter/material.dart';
import 'package:tourandtravel/screens/current_location_screen.dart';
import 'package:tourandtravel/screens/nearby_places_screen.dart';
import 'package:tourandtravel/screens/search_places_screen.dart';
import 'package:tourandtravel/screens/simple_map_screen.dart';

import 'screens/polyline_screen.dart';

class Homeii extends StatefulWidget {
  const Homeii({Key? key}) : super(key: key);

  @override
  _HomeiiState createState() => _HomeiiState();
}

class _HomeiiState extends State<Homeii> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ethio T&T"),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const SimpleMapScreen();
                      }));
                    },
                    child: const Text("Simple Map")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const CurrentLocationScreen();
                      }));
                    },
                    child: const Text("User current location")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const SearchPlacesScreen();
                      }));
                    },
                    child: const Text("Search Places")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const NearByPlacesScreen();
                      }));
                    },
                    child: const Text("Near by Places")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const PolylineScreen();
                      }));
                    },
                    child: const Text("Polyline between 2 points"))
              ],
            ),
          ),
        ));
  }
}
