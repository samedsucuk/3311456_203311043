import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar   (backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "WELCOME",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),    
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,  
        initialCameraPosition: const CameraPosition(
        target: LatLng(38.0286349,32.5071287),
        zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}