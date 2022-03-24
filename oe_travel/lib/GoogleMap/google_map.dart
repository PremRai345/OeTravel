import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapMultiMarker extends StatefulWidget {
  const MapMultiMarker({Key? key}) : super(key: key);

  @override
  State<MapMultiMarker> createState() => _MapMultiMarkerState();
}

class _MapMultiMarkerState extends State<MapMultiMarker> {
  final List<Map<String, dynamic>> cityList = [
    {
      "address": "Kathmandu, Nepal",
      "id": "1",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      "lat": 27.7172453,
      "lng": 85.3239605,
      "name": "Kathmandu",
      "region": "South Asia",
      "type": "City",
      "rating": "4.5",
    },
    {
      "address": "Pokhara, Nepal",
      "id": "2",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      "lat": 28.2314,
      "lng": 83.9850,
      "name": "Pokhara",
      "region": "South Asia",
      "type": "City",
      "rating": "4",
    },
    {
      "address": "Illam, Nepal",
      "id": "3",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      "lat": 26.912,
      "lng": 87.912,
      "name": "Illam",
      "region": "South Asia",
      "type": "Village",
      "rating": "5",
    },
    {
      "address": "Buddhashanti, Nepal",
      "id": "4",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      "lat": 26.7244,
      "lng": 88.0412,
      "name": "Buddhashanti",
      "region": "South Asia",
      "type": "Town",
      "rating": "8",
    },
    {
      "address": "Rara Lake",
      "id": "5",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      "lat": 29.5239,
      "lng": 82.0788,
      "name": "Rara Lake",
      "region": "South Asia",
      "type": "Lake",
      "rating": "10",
    },
    {
      "address": "Mount Everest",
      "id": "6",
      "image":
          "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      "lat": 27.9881,
      "lng": 86.9226,
      "name": "Mount Everest",
      "region": "South Asia",
      "type": "Mountain",
      "rating": "10",
    }
  ];

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      for (int i = 0; i < cityList.length; i++) {
        print("For Loop");
        final marker = Marker(
          markerId: MarkerId(cityList[i]['name']),
          position: LatLng(cityList[i]['lat'], cityList[i]['lng']),
          infoWindow: InfoWindow(
              title: cityList[i]['name'],
              snippet: cityList[i]['address'],
              onTap: () {
                print("${cityList[i]['lat']}, ${cityList[i]['lng']}");
              }),
          onTap: () {
            print("Clicked on marker");
          },
        );
        print("${cityList[i]['lat']}, ${cityList[i]['lng']}");
        _markers[cityList[i]['name']] = marker;
      }
    });
  }

  launchMap(lat, lng) {
    MapsLauncher.launchCoordinates(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(cityList[0]['lat'], cityList[0]['lng']),
        zoom: 4.8,
      ),
      markers: _markers.values.toSet(),
    );
  }
}
