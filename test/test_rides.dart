import 'package:blabla/model/ride/ride.dart';

import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/service/rides_service.dart';
//import 'package:blabla/services/rides_service.dart';

void main() {
  // Location dijon = Location(country: Country.france, name: "Dijon");

  // List<Ride> filteredRide = RidesService.filter(requestedSeats: 2, departureLocation: dijon);

  // for (Ride ride in filteredRide) {
  //   print(ride);
  // }

  List<Ride> filteredRides = RidesService.filterBy(
    departure: Location(name: "Dijon", country: Country.france),
    seatRequested: 2,
  );

  for (var ride in filteredRides) {
    print(ride.departureLocation.name);
  }
}
