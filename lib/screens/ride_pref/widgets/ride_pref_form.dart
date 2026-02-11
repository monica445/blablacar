import 'package:blabla/screens/location/location_screen.dart';
import 'package:blabla/screens/ride/ride_screen.dart';
import 'package:blabla/screens/ride_pref/widgets/ride_pref_seat_selection.dart';
import 'package:blabla/theme/theme.dart';
import 'package:blabla/utils/date_time_util.dart';
import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();

    //if ride reference is passed, initialize attributes from it
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      departureDate = widget.initRidePref!.departureDate;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departure = null;
      arrival = null;
      departureDate = DateTime.now().subtract(const Duration(days: 7));
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  void _swapLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  Future<void> _selectDeparture() async {
    final Location? selectedDeparture = await Navigator.push<Location>(
      context,
      MaterialPageRoute(builder: (_) => const LocationScreen()),
    );

    if (selectedDeparture != null) {
      setState(() {
        departure = selectedDeparture;
      });
    }
  }

  Future<void> _selectArrival() async {
    final Location? selectedArrival = await Navigator.push<Location>(
      context,
      MaterialPageRoute(builder: (_) => const LocationScreen()),
    );

    if (selectedArrival != null) {
      setState(() {
        arrival = selectedArrival;
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime now = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: BlaColors.primary,
              onPrimary: BlaColors.white,
              onSurface: BlaColors.neutralDark,
            ),
            dialogTheme: DialogThemeData(backgroundColor: BlaColors.white),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: BlaColors.primary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        departureDate = pickedDate;
      });
    }
  }

  Future<void> _selectSeats() async {
    final int? selectedSeats = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (_) => RidePrefSeatSelection(initialSeats: requestedSeats),
      ),
    );

    if (selectedSeats != null) {
      setState(() {
        requestedSeats = selectedSeats;
      });
    }
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  String get departureLabel => departure?.name ?? "Leaving from";
  String get arrivalLabel => arrival?.name ?? "Going to";
  String get dateLabel => DateTimeUtils.formatDateTime(departureDate);

  String get seatsLabel => '$requestedSeats';

  Color _labelColor(bool isPlaceholder) {
    return isPlaceholder ? BlaColors.textLight : BlaColors.textNormal;
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _formButton(
          label: departureLabel,
          icon: Icons.circle_outlined,
          isPlaceholder: departure == null,
          onPressed: _selectDeparture,
          trailing: IconButton(
            icon: Icon(Icons.swap_vert, color: BlaColors.primary),
            onPressed: _swapLocations,
          ),
        ),
        _formButton(
          label: arrivalLabel,
          icon: Icons.circle_outlined,
          isPlaceholder: arrival == null,
          onPressed: _selectArrival,
        ),
        _formButton(
          label: dateLabel,
          icon: Icons.calendar_month_outlined,
          isPlaceholder: false,
          onPressed: _selectDate,
        ),
        _formButton(
          label: seatsLabel,
          icon: Icons.person_outline,
          isPlaceholder: false,
          onPressed: _selectSeats,
        ),
        BlaButton(
          text: "Search",
          onPressed: departure != null
            ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RideScreen(
                        departure: departure!,
                        requestedSeats: requestedSeats,
                      ),
                    ),
                  );
                }
              : null,
        ),
      ],
    );
  }

  Widget _formButton({
    required String label,
    required IconData icon,
    required bool isPlaceholder,
    required VoidCallback onPressed,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: BlaSpacings.m),
              child: Row(
                children: [
                  Icon(icon, color: BlaColors.iconLight),
                  const SizedBox(width: BlaSpacings.s),
                  Text(
                    label,
                    style: BlaTextStyles.body.copyWith(
                      color: _labelColor(isPlaceholder),
                    ),
                  ),
                  const Spacer(),
                  if (trailing != null) trailing,
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: BlaColors.greyLight),
          ],
        ),
      ),
    );
  }
}
