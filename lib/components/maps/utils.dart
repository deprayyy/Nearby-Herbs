import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Utils {
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(-6.1753924, 106.8271528),
    zoom: 14.0,
  );

  static BitmapDescriptor? userLocationIcon;

  static Future<void> setCustomMapPin() async {
    userLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/applelogo.png',
    );
  }

  static Set<Marker> getMarkers() {
    final Set<Marker> markers = {};
    final Marker marker = Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(-6.1753924, 106.8271528),
      infoWindow: const InfoWindow(title: 'Kota Jakarta'),
      onTap: () {
        // handle marker tap
      },
    );
    markers.add(marker);
    return markers;
  }

  static Widget buildMapWidget(Set<Marker> markers) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapToolbarEnabled: true,
      mapType: MapType.normal,
      markers: markers,
    );
  }
}
