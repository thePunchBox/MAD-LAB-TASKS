import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? position;
  String? address;

  Future<bool> handlePermission() async {
    bool gps = await Geolocator.isLocationServiceEnabled();
    if (!gps) {
      print("Gps disabled");
      return false;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permission Denied");
        return false;
      } else if (permission == LocationPermission.deniedForever) {
        print("Enable Permission in settings");
        return false;
      }
    }
    return true;
  }

  getAddress(Position position) async {
    List<Placemark> places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final place = places[0];
    setState(() {
      address =
          """${place.name}, ${place.street}, ${place.locality}, ${place.country}""";
    });
  }

  getCurrentLocation() async {
    bool permission = await handlePermission();
    if (permission) {
      final _position = await Geolocator.getCurrentPosition();
      setState(() {
        position = _position;
      });
      await getAddress(_position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("${position?.latitude} -- ${position?.longitude}"),
            Text(address ?? "No address available"), // Display address
            ElevatedButton(
              onPressed: getCurrentLocation,
              child: Text("Fetch Location"),
            ),
          ],
        ),
      ),
    );
  }
}
