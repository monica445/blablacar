import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/screens/ride/widgets/ride_card.dart';
import 'package:blabla/service/rides_service.dart';
import 'package:flutter/material.dart';

class RideScreen extends StatelessWidget {
  final Location departure;
  final Location arrival;
  final int requestedSeats;

  const RideScreen({
    super.key,
    required this.departure,
    required this.arrival,
    required this.requestedSeats,
  });

  @override
  Widget build(BuildContext context) {

    if (departure == arrival) {
      return Scaffold(
        appBar: AppBar(title: const Text('Available rides')),
        body: const Center(
          child: Text("Can't find this ride. You need to choose a destination that is different from you starting point to find a ride"),
        ),
      );
    }

    final List<Ride> rides = RidesService.filterBy(
      departure: departure,
      arrival: arrival,
      seatRequested: requestedSeats,
    );
    
    return Scaffold(
      appBar: AppBar(title: const Text('Available rides')),
      body: rides.isEmpty
          ? const Center(child: Text('No rides available'))
          : ListView.builder(
              itemCount: rides.length,
              itemBuilder: (context, index) {
                return RideCard(ride: rides[index]);
              },
            ),
    );
  }
}
