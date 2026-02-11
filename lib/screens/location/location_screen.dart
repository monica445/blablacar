import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/screens/location/widgets/location_tile.dart';
import 'package:blabla/service/locations_service.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<LocationScreen> {
  final TextEditingController _controller = TextEditingController();

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
                      setState(() {});
                    },
                  ),
                ),
                if (_controller.text.isNotEmpty)
                  IconButton(
                    onPressed: () {
                      _controller.clear(); 
                      setState(() {});
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
