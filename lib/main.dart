import 'package:flutter/material.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: const AllAssignments(title: 'List Of Assignments'),
    );
  }
}

class AllAssignments extends StatelessWidget {
  const AllAssignments({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.slate100,
        title: Text(
          title!,
          style: TextStyle(
            color: TColor.emerald700,
            fontSize: 24,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: TColor.slate100,
        child: ListView(
          children: <Widget>[
            Container(
              color: TColor.slate400,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/85547877?v=4'),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text('Samarth Kulkarni', style: TextStyle(color: TColor.slate100, fontSize: 24)),
                  Text('Software Engineer', style: TextStyle(color: TColor.slate100.withOpacity(0.9), fontSize: 14)),
                  Text('Current Project: Kindkart', style: TextStyle(color: TColor.slate100.withOpacity(0.8), fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text('All assignments will be listed here:')

          ],
        ),
      )
    );
  }
}
