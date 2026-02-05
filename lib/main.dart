import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride/ride.dart';
//import 'package:blabla/screens/ride_pref/ride_pref_screen.dart';
import 'package:blabla/service/rides_service.dart';

//import 'package:blabla/theme/theme.dart';
// import 'package:blabla/week3/ui/screens/ride_pref/ride_prefs_screen.dart';
// import 'package:blabla/week3/ui/theme/theme.dart';
//import 'package:flutter/material.dart';
void main() {
  //runApp(const BlaBlaApp());
  List<Ride> filteredRides = RidesService.filterBy(
    departure: Location(name: "Dijon", country: Country.france),
    seatRequested: 2,
  );

  print("Filtered Rides");

  for (var ride in filteredRides) {
    print(ride.departureLocation.name);
  }
}

// class BlaBlaApp extends StatelessWidget {
//   const BlaBlaApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: appTheme,
//       home: Scaffold(body: RidePrefScreen()),
//     );
//   }
// }
