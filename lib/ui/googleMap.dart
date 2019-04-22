import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GGMap extends StatelessWidget{
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Google Map'),),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  _kGooglePlex,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        }
      ),
    );
  }

}
