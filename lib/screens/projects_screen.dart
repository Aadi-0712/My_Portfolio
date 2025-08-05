import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Volunteer Matching App',
      'description': 'A machine learning based web app to match volunteers with NGOs.',
      'tech': 'Flask, SQLite, scikit-learn',
      'link': 'https://github.com/Aadi-0712/Volunteer_Matching_Application'
    },
    {
      'title': 'Internship Tracker System',
      'description': 'React-Node-Mongo app to track student internship submissions.',
      'tech': 'React.js, Node.js, MongoDB',
      'link': 'https://github.com/your-username/internship-tracker'
    },
    {
      'title': 'Eduroute',
      'description': 'Skill learning roadmap app with Firebase backend.',
      'tech': 'Flutter, Firebase',
      'link': 'https://github.com/your-username/eduroute-app'
    },
  ];

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E), // dark background
      appBar: AppBar(
        backgroundColor: Color(0xFF2C2C2E),
        title: Text('My Projects', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C2C2E), Color(0xFF3A3A3C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    project['description']!,
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tech Stack: ${project['tech']}',
                    style: TextStyle(color: Colors.white60, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL(project['link']!),
                      icon: Icon(Icons.code, size: 18),
                      label: Text('View on GitHub'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent.shade700,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
