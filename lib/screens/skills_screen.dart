import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsScreen extends StatelessWidget {
  final Map<String, List<String>> skillCategories = {
    'Frontend': ['Flutter', 'React.js', 'HTML/CSS', 'JavaScript'],
    'Backend': ['Spring Boot', 'Node.js', 'Flask'],
    'Database': ['MongoDB', 'SQLite', 'Firebase'],
    'Tools': ['Git', 'Firebase', 'Figma', 'VS Code'],
    'Languages': ['Java', 'Python', 'Dart', 'C++'],
  };

  final Map<String, IconData> categoryIcons = {
    'Frontend': Icons.palette,
    'Backend': Icons.settings,
    'Database': Icons.storage,
    'Tools': Icons.build,
    'Languages': Icons.code,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        title: Text(
          'My Skills',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1F1B24), // Darker AppBar
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: skillCategories.entries.map((entry) {
            return Card(
              color: const Color(0xFF1E1E1E),
              elevation: 8,
              shadowColor: Colors.deepPurpleAccent.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          categoryIcons[entry.key] ?? Icons.star,
                          color: Colors.deepPurpleAccent,
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          entry.key,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: entry.value.map((skill) {
                        return Chip(
                          label: Text(
                            skill,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                          Colors.deepPurpleAccent.withOpacity(0.3),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
