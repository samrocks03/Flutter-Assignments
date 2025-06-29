import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_constants.dart';
import 'package:flutter_assignments/routes/route_names.dart';

class NavigationHelpers {
  // Navigate to profile card without data
  static void navigateToProfileCard({required BuildContext context}) {
    Navigator.pushNamed(context, RouteNames.profileCard);
  }

  // Navigate to profile card with data
  static void navigateToProfileCardWithData(BuildContext context, ProfileModel profile) {
    Navigator.pushNamed(context, RouteNames.profileCardWithData, arguments: profile);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // Replace current route
  static void navigateAndReplace(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  // Clear stack and navigate
  static void navigateAndClearStack(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
    );
  }

}
