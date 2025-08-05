import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: Text(
          'About Me',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0F3460),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
            const SizedBox(height: 20),

            // Name & Intro
            Text(
              'Hello! I\'m Aditya Yerokar 👋',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF9D84EF),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'I am an aspiring Android and Web Developer with expertise in Flutter, Spring Boot, and Firebase.\n\n'
                  'Currently pursuing B.Tech in Computer Science & Business Systems. I enjoy building scalable and user-friendly applications. I’m passionate about merging tech with business to solve real-world problems.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            // Education
            Text(
              '🎓 Education',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: const Color(0xFF16213E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.school, color: Color(0xFF9D84EF)),
                title: Text(
                  'B.Tech in CSBS',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'KITs College Of Engineering, Kolhapur\n2023 - 2026',
                  style: GoogleFonts.poppins(
                    color: Colors.white60,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Interests
            Text(
              '🎯 Interests',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                buildDarkChip('Flutter'),
                buildDarkChip('Web Development'),
                buildDarkChip('UI/UX Design'),
                buildDarkChip('Cloud Integration'),
                buildDarkChip('Spring Boot'),
                buildDarkChip('Java'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Chip with dark theme styling
  Widget buildDarkChip(String label) {
    return Chip(
      label: Text(
        label,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF0F3460),
      shape: StadiumBorder(side: BorderSide(color: Color(0xFF9D84EF))),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }
}
