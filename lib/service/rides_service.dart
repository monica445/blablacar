import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; 

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(Location departure) {
    return RidesService.availableRides
        .where((ride) => ride.departureLocation.name.contains(departure.name))
        .toList();
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(int requestedSeat) {
    return RidesService.availableRides
        .where((ride) => ride.availableSeats >= requestedSeat)
        .toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> filteredRide = RidesService.availableRides;

    if (departure != null) {
      filteredRide = _filterByDeparture(departure);
    }

    if (seatRequested != null) {
      filteredRide = _filterBySeatRequested(seatRequested);
    }

    return filteredRide;
  }
}
