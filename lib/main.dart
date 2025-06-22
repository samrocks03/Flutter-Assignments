import 'package:flutter/material.dart';
// import 'package:flutter_assignments/assignments/assignment_one/profile_card.dart';
import 'package:flutter_assignments/constants/profile_constants.dart';
import 'package:flutter_assignments/helpers/navigation_helpers.dart';
import 'package:flutter_assignments/routes/route_generator.dart';
import 'package:tailwind_standards/tailwind_standards.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignments',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: const AllAssignments(
        title: 'List Of Assignments', 
        samarthProfile: ProfileConstants.samarthKulkarniProfile
      ),

      // All route settings
      initialRoute: RouteGenerator.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('404')),
          body: const Center(
            child: Text('Page not found!'),
          ),
        ),
      ),

      
    );
  }
}

class AllAssignments extends StatelessWidget {
  const AllAssignments({super.key, this.title, this.samarthProfile});

  final String? title;
  final ProfileModel? samarthProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.slate300,
        title: Text(
          title!,
          style: TextStyle(
            color: TColor.slate800,
            fontSize: 24,
          ),
        ),
      ),
      drawer: Drawer(
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
                      backgroundImage: NetworkImage(samarthProfile?.imageUrl ?? 'https://avatars.githubusercontent.com/u/85547877?v=4'),
                      radius: 40,
                    ),
                  ),
                  
                  SizedBox(height: 10),

                  Text(samarthProfile?.name ?? 'Samarth Kulkarni', style: TextStyle(color: TColor.slate100, fontSize: 24)),

                  Text(samarthProfile?.role ?? 'Software Engineer', style: TextStyle(color: TColor.slate100.withOpacity(0.9), fontSize: 14)),

                  Text('Current Project: ${samarthProfile?.currentProject ?? 'Kindkart'}', style: TextStyle(color: TColor.slate100.withOpacity(0.8), fontSize: 12)),
                ],
              ),
            ),

            
          ],
        ),
      ),

      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 10),

            Text('All assignments will be listed here:'),

            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfileCard()),
                // );

                NavigationHelpers.navigateAndReplace(context, RouteGenerator.profileCardWithData);
              },
              child: Text('Assignment 1: Profile Card'),
            ),

            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfileCard(profile: ProfileConstants.ajinkyaKaranjikarProfile)),
                // );

                NavigationHelpers.navigateToProfileCardWithData(
                  context,
                  ProfileConstants.ajinkyaKaranjikarProfile,
                );
              },
              child: Text('Assignment 2: Profile Card passing data'),
            ),
          ],
        ),
      )
    );
  }
}
