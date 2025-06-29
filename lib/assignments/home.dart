import 'package:flutter/material.dart';
import 'package:flutter_assignments/helpers/accessories_styles.dart';
import 'package:flutter_assignments/models/profile_constants.dart';
import 'package:flutter_assignments/helpers/navigation_helpers.dart';
import 'package:flutter_assignments/routes/route_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 10),

            Text('All assignments will be listed here:'),

            ElevatedButton(
              style: roundedElevatedButtonStyle,
              onPressed: () {
                NavigationHelpers.navigateToProfileCard(context: context);
              },
              child: Text('Assignment 1: Profile Card'),
            ),

            ElevatedButton(
              style: roundedElevatedButtonStyle,
              onPressed: () {
                NavigationHelpers.navigateToProfileCardWithData(
                  context,
                  ProfileConstants.ajinkyaKaranjikarProfile,
                );
              },
              child: Text('Assignment 2: Profile Card passing data'),
            ),

            ElevatedButton(
              style: roundedElevatedButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.login);
              },
              child: Text('Assignment 3: Login'),
            ),

          ],
        ),
      );
  }
}