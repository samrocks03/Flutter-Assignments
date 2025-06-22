import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tailwind_standards/tailwind_standards.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  Future<void> _launchURL(String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);
      
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Could not launch $urlString');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A1: Profile Card'),
        backgroundColor: TColor.slate300,
      ),

      body: Center(
        child: Container(
          height: 489,
          width: 300,
          decoration: BoxDecoration(
            // color: TColor.slate200,
            borderRadius: BorderRadius.circular(30),
            // boxShadow: [
            //   BoxShadow(
            //     // blurRadius: 10,
            //     // offset: Offset(0, 5),
            //     // color: TColor.slate500
            //   ),
            // ],
          ),

          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
                borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFED213A),
                        Color(0xFF93291E),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
            
                // Profile Image section
                Transform.translate(
                  offset: Offset(0, -50),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
            
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/85547877?v=4',
                      ),
                    ),
                    
                  ),
                ),
            
            
                // Content Section:
                Transform.translate(
                  offset: Offset(0, -20),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    
                    child: Column(
                      children: [
                        const Text(
                          'Samarth Kulkarni',
                          style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                          ),
                    
                          const SizedBox(height: 2),
                    
                          const Text(
                                'Software Engineer',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                    
                          const SizedBox(height: 8),
                    
                          Container(
                            width: 160,
                            height: 2,
                            color: Color(0xFFED213A),
                          ),
                    
                          const SizedBox(height: 8),
                    
                          const Text(
                            'An engineer powered by curiosity!',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                    
                          const SizedBox(height: 20),
                    
                    
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  // borderRadius: BorderRadius.circular(20),
                                  onTap: () => _launchURL('https://www.hackerrank.com/samrocks003'),
                                  child: const FaIcon(
                                    FontAwesomeIcons.hackerrank,
                                    color: Color(0xFFED213A),
                                    size: 24,
                                  ),
                                ),
                                
                                const SizedBox(width: 20),
                  
                                GestureDetector(
                                  onTap: () => _launchURL('https://github.com/samrocks03'),
                                  child: const FaIcon(
                                    FontAwesomeIcons.github,
                                    color: Color(0xFFED213A),
                                    size: 24,
                                  ),
                                ),
                                
                                const SizedBox(width: 20),
                  
                                GestureDetector(
                                  onTap: () => _launchURL('https://www.linkedin.com/in/samarthvkulkarni'),
                                  child: const FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    color: Color(0xFFED213A),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),

    );
  }
}