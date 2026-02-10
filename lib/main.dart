import 'package:blabla/screens/ride_pref/ride_pref_screen.dart';
import 'package:blabla/theme/theme.dart';
import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const BlaBlaApp());
  
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: RidePrefScreen()
        // body: Column(
        //   children: [
        //     BlaButton(text: "Primary Button", onPressed: (){},),
        //     const SizedBox(height: 20,),
        //     BlaButton(text: "Secondary Button", onPressed: (){}, type: BlaButtonType.secondary, icon: Icons.thumb_up,)
        //   ],
        // )
      ),
    );
  }
}
