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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.grey.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              offset: Offset(2, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 34, color: Colors.tealAccent),
            SizedBox(height: 10),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // Gradient-glow border around profile pic
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [Colors.tealAccent, Colors.blueGrey.shade900],
                    startAngle: 0.0,
                    endAngle: 3.14 * 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(profileImage),
                ),
              ),
              SizedBox(height: 20),

              // Name and glow-style header
              Text(
                'Aditya Yerokar',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.3,
                  shadows: [
                    Shadow(
                      color: Colors.tealAccent.withOpacity(0.6),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),

              SizedBox(height: 8),
              // Animated Text
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText('Flutter Developer',
                      textStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.tealAccent)),
                  TyperAnimatedText('Spring Boot Enthusiast',
                      textStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.tealAccent)),
                  TyperAnimatedText('Firebase Integrator',
                      textStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.tealAccent)),
                  TyperAnimatedText('Business-Oriented Builder',
                      textStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.tealAccent)),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Hi! I’m Aditya Yerokar, a passionate developer blending design and logic to build engaging digital solutions using Flutter, Firebase, and Spring Boot.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ),
              SizedBox(height: 25),

              // Tagline
              Text(
                '"Building experiences, not just apps."',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                ),
              ),

              SizedBox(height: 30),

              // Feature Cards Grid
              Wrap(
                spacing: 18,
                runSpacing: 18,
                alignment: WrapAlignment.center,
                children: [
                  _buildFeatureCard(
                    context,
                    icon: Icons.person,
                    title: 'About Me',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutScreen())),
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.folder,
                    title: 'Projects',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProjectsScreen())),
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.build,
                    title: 'My Skills',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SkillsScreen())),
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.mail,
                    title: 'Contact Me',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ContactScreen())),
                  ),
                ],
              ),

              SizedBox(height: 40),

              // Optional: Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.code, size: 18, color: Colors.tealAccent),
                  SizedBox(width: 6),
                  Text(
                    'Crafted with Flutter',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
