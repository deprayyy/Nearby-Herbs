import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/shop_models.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  String userAddress = '';

  static const CameraPosition _googleMapController = CameraPosition(
    target: LatLng(-6.484179914635534, 106.84262046321857),
    zoom: 14.4746,
  );

  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _addUserLocationMarker();
  }

  void _addMarkers() {
    for (var tokoObat in daftarTokoObat) {
      _markers.add(
        Marker(
          markerId: MarkerId(tokoObat.idToko.toString()),
          position: LatLng(tokoObat.latitude, tokoObat.longitude, ),
          infoWindow: InfoWindow(title: tokoObat.nama, snippet: tokoObat.alamat),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        ),
      );
    }
  }

  void _addUserLocationMarker() async {
    LatLng userLocation = await getCurrentLocation();
    String latLngString = 'Latitude: ${userLocation.latitude}, Longitude: ${userLocation.longitude}';

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(userLocation.latitude, userLocation.longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        userAddress = '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
      } else {
        userAddress = 'Address not found';
      }
    } catch (e) {
      userAddress = 'Error fetching address';
    }

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('user_location'),
          position: userLocation,
          infoWindow: InfoWindow(title: 'Lokasi Anda', snippet: '$latLngString\n$userAddress'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    });
  }

  Future<LatLng> getCurrentLocation() async {
    final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
    Position position = await geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _googleMapController,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.from(_markers),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newLatLng(
                  const LatLng(-6.4958537, 106.8437251),
                ),
              );
              // Panggil fungsi untuk menampilkan bottom card list.
            },
            focusColor: Colors.black,
            child: const Icon(Icons.center_focus_strong),
          ),
        ],
      ),
    );
  }
}