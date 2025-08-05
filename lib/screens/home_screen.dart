import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_screen.dart';
import 'projects_screen.dart';
import 'skills_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatelessWidget {
  final String profileImage = 'assets/profile.png';

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.grey.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 8,
              offset: Offset(2, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.tealAccent),
            SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(profileImage),
                ),
                SizedBox(height: 20),
                Text(
                  'Aditya Yerokar',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 10),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Flutter Developer',
                      textStyle: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.tealAccent),
                    ),
                    TyperAnimatedText(
                      'Spring Boot Enthusiast',
                      textStyle: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.tealAccent),
                    ),
                    TyperAnimatedText(
                      'Firebase Integrator',
                      textStyle: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.tealAccent),
                    ),
                    TyperAnimatedText(
                      'Business-Oriented Builder',
                      textStyle: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.tealAccent),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildFeatureCard(
                      context,
                      icon: Icons.person,
                      title: 'About Me',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      ),
                    ),
                    _buildFeatureCard(
                      context,
                      icon: Icons.folder,
                      title: 'Projects',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProjectsScreen()),
                      ),
                    ),
                    _buildFeatureCard(
                      context,
                      icon: Icons.build,
                      title: 'My Skills',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SkillsScreen()),
                      ),
                    ),
                    _buildFeatureCard(
                      context,
                      icon: Icons.mail,
                      title: 'Contact Me',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactScreen()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
