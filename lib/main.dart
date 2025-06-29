import 'package:flutter/material.dart';
import 'package:flutter_assignments/assignments/assignment_one/drawer.dart';
import 'package:flutter_assignments/assignments/home.dart';
import 'package:flutter_assignments/constants/profile_constants.dart';
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
      drawer: HomeDrawer(userProfile: samarthProfile!),
      body: HomeScreen()
    );
  }
}
