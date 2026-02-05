
import 'package:blabla/screens/ride_pref/ride_pref_screen.dart';
// import 'package:blabla/week3/ui/screens/ride_pref/ride_prefs_screen.dart';
// import 'package:blabla/week3/ui/theme/theme.dart';
import 'package:flutter/material.dart';
void main() {
   runApp(const BlaBlaApp()); 
}


class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: blaTh,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
