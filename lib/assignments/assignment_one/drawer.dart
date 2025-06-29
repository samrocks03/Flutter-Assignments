import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_constants.dart';
import 'package:flutter_assignments/helpers/navigation_helpers.dart';
import 'package:tailwind_standards/tailwind_standards.dart';

class HomeDrawer extends StatelessWidget {
  final ProfileModel userProfile;

  const HomeDrawer({super.key, required this.userProfile});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: TColor.slate100,
        child: ListView(
          children: [
            Container(
              color: TColor.slate400,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // trying out positional arguments
                      NavigationHelpers.navigateToProfileCard(context: context);
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(userProfile.imageUrl),
                      radius: 40,
                    ),
                  ),
                  
                  SizedBox(height: 10),

                  Text(userProfile.name, style: TextStyle(color: TColor.slate100, fontSize: 24)),

                  Text(userProfile.role, style: TextStyle(color: TColor.slate100.withOpacity(0.9), fontSize: 14)),

                  Text('Current Project: ${userProfile.currentProject}', style: TextStyle(color: TColor.slate100.withOpacity(0.8), fontSize: 12)),
                ],
              ),
            ),

            
          ],
        ),
      );
  }
}