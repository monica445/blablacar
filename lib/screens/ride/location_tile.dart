import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  //final bool? isRecent;
  final VoidCallback? onTap;
  const LocationTile({super.key, required this.location, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        location.name,
        style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal),
      ),
      subtitle: Text(
        location.country.name,
        style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: BlaColors.iconLight,
        size: 16,
      ),
    );
  }
}
