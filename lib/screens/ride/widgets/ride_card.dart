import 'package:flutter/material.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/utils/date_time_util.dart';

class RideCard extends StatelessWidget {
  final Ride ride;

  const RideCard({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${ride.departureLocation.name} → ${ride.arrivalLocation.name}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), 
            Row(
              children: [
                const Icon(Icons.schedule, size: 18),
                const SizedBox(width: 8),
                Text(
                  '${DateTimeUtils.formatDateTime(ride.departureDate)}'
                  ' - ${DateTimeUtils.formatDateTime(ride.arrivalDateTime)}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),

            const SizedBox(height: 12),  
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      '${ride.driver.firstName} ${ride.driver.lastName}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),

                Text(
                  '\$${ride.pricePerSeat.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),  
          ],
        ),
      ),
    );
  }
}
