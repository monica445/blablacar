import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/screens/ride/location_tile.dart';
import 'package:blabla/service/locations_service.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../dummy_data/dummy_data.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  final TextEditingController _controller = TextEditingController();

  // Filter locations based on current text in the controller
  List<Location> get filteredLocations {
    final term = _controller.text.toLowerCase();
    if (term.isEmpty) return LocationsService.availableLocations;
    return LocationsService.availableLocations
        .where(
          (loc) =>
              loc.name.toLowerCase().contains(term) ||
              loc.country.name.toLowerCase().contains(term),
        )
        .toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: BlaColors.greyLight,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (_) {
                      setState(() {}); // rebuild list on every keystroke
                    },
                  ),
                ),
                if (_controller.text.isNotEmpty)
                  IconButton(
                    onPressed: () {
                      _controller.clear(); // clear text
                      setState(() {}); // rebuild to hide cancel icon
                    },
                    icon: Icon(Icons.cancel),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = filteredLocations[index];
                  return LocationTile(
                    location: location,
                    onTap: () => Navigator.pop(context, location),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
