import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides;

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(List<Ride> rides, Location departure) {
    return rides.where((ride) => ride.departureLocation == departure).toList();
  }

  static List<Ride> _filterByArrival(List<Ride> rides, Location arrival) =>
      rides.where((ride) => ride.arrivalLocation == arrival).toList();

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(
    List<Ride> rides,
    int requestedSeat,
  ) {
    return rides.where((ride) => ride.availableSeats >= requestedSeat).toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({
    Location? departure,
    Location? arrival,
    int? seatRequested,
  }) {
    List<Ride> filteredRide = RidesService.availableRides;

    if (departure != null) {
      filteredRide = _filterByDeparture(filteredRide, departure);
    }

    if (arrival != null) {
      filteredRide = _filterByArrival(filteredRide, arrival);
    }

    if (seatRequested != null) {
      filteredRide = _filterBySeatRequested(filteredRide, seatRequested);
    }

    return filteredRide;
  }
}
