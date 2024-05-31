import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;
  Position? currentPosition;
  final Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    _requestPermission();
    _getCurrentLocation();
  }
  
  Future <void> _requestPermission() async{
    await Permission.location.request();
  }
  
  Future <void> _getCurrentLocation() async{
    currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
    });
  }
  
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NaviTrack'),
      ),
      body: currentPosition == null
      ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: LatLng(13.08966371801942, 80.2687499053693,),
          zoom: 14,
          ),
        markers: _markers,
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: _addMarker
      tooltip: "ADD MARKER",
        child: Icon(Icons.add_location),
    ),
    );
  }
  void _addMarker(){
    final marker = Marker(markerId: )
  }
}
