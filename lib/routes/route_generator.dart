import 'package:flutter/material.dart';
import 'package:flutter_assignments/assignments/assignment_one/profile_card.dart';
import 'package:flutter_assignments/assignments/assignment_three/login_screen.dart';
import 'package:flutter_assignments/assignments/assignment_three/otp_success_screen.dart';
import 'package:flutter_assignments/assignments/assignment_three/otp_verification_screen.dart';
import 'package:flutter_assignments/models/profile_constants.dart';
import 'package:flutter_assignments/main.dart';
import 'package:flutter_assignments/routes/route_names.dart';

class RouteGenerator {
  // static const String home = '/';
  // static const String profileCard = '/profile-card';
  // static const String profileCardWithData = '/profile-card-with-data';

  static const String home = RouteNames.home;
  static const String profileCard = RouteNames.profileCard;
  static const String profileCardWithData = RouteNames.profileCardWithData;
  static const String timePass = RouteNames.timePass;
  static const String login = RouteNames.login;
  static const String otpVerification = RouteNames.otpVerification;
  static const String otpSuccess = RouteNames.otpSuccess;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const AllAssignments(title: 'List Of Assignments'),
        );

      case profileCard:
        return MaterialPageRoute(
          builder: (_) => const ProfileCard(),
        );

      case profileCardWithData:
        // Extract profile from arguments
        final ProfileModel? profile = settings.arguments as ProfileModel?;
        
        if (profile != null) {
          return MaterialPageRoute(
            builder: (_) => ProfileCard(profile: profile),
          );
        }

        // If no profile provided, use default
        return MaterialPageRoute(
          builder: (_) => ProfileCard(profile: ProfileConstants.samarthKulkarniProfile),
        );

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case otpVerification:
      // OtpVerificationScreen to be added
        return MaterialPageRoute(builder: (_) => OtpVerificationScreen());

      case otpSuccess:
        return MaterialPageRoute(builder: (_) => OtpSuccessScreen());

        default:
          return MaterialPageRoute(
            builder: (_) => const AllAssignments(title: 'List Of Assignments'),
          );
    }
  }
}
