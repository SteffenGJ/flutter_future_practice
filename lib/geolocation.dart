import 'package:flutter/material.dart';
import "package:geolocator/geolocator.dart";

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  //String myPosition = "";

  // @override
  // void initState() {
  //   getPosition().then((Position myPos) {
  //     setState(() {
  //       myPosition =
  //           "Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}";
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Locations")),
      body: Center(
          child: FutureBuilder(
        future: getPosition(),
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Text(snapshot.data.toString());
          } else {
            return const Text("");
          }
        },
      )),
    );
  }

  Future<Position> getPosition() async {
    await Future.delayed(const Duration(seconds: 3));
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
