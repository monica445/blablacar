import 'package:blabla/theme/theme.dart';
import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

class RidePrefSeatSelection extends StatefulWidget {
  final int initialSeats;
  const RidePrefSeatSelection({super.key, required this.initialSeats});

  @override
  State<RidePrefSeatSelection> createState() => _RidePrefSeatSelectionState();
}

class _RidePrefSeatSelectionState extends State<RidePrefSeatSelection> {
  late int requestedSeats;

  @override
  void initState() {
    super.initState();
    requestedSeats = widget.initialSeats;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BlaColors.white,
        leading: IconButton(
          icon: Icon(Icons.close, color: BlaColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Number of seats to book", style: BlaTextStyles.heading,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: requestedSeats > 1 
                    ? () => setState(() => requestedSeats--)
                    : null,
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: requestedSeats > 1 ? BlaColors.primary : BlaColors.disabled,
                    size: 40,
                  ),
                ),
                Text(requestedSeats.toString(), style: BlaTextStyles.heading,),
                IconButton(
                  onPressed: () => setState(() => requestedSeats ++),
                  icon: Icon(
                    Icons.add_circle_outline, 
                    color: BlaColors.primary,
                    size: 40,
                  ),
                ),
              ],
            ),

            BlaButton(
              text: "Confirm", 
              onPressed: () {
                Navigator.pop(context, requestedSeats);
              },
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}
