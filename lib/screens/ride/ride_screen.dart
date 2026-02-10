import 'package:blabla/model/ride/locations.dart';
import 'package:flutter/material.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final location = Location(name: 'CADT', country: Country.france);
            Navigator.pop(context, location);
          },
          child: const Text('CADT, Phnom Penh'),
        ),
      ),
    );
  }
}
