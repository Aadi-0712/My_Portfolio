import 'package:flutter/material.dart';
import '../models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(project.description),
            SizedBox(height: 8),
            Text('Tech Stack: ${project.techStack}', style: TextStyle(fontStyle: FontStyle.italic)),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _launchURL(project.githubLink),
                  icon: Icon(Icons.code),
                  label: Text('GitHub'),
                ),
                SizedBox(width: 10),
                if (project.liveLink != null)
                  ElevatedButton.icon(
                    onPressed: () => _launchURL(project.liveLink!),
                    icon: Icon(Icons.open_in_browser),
                    label: Text('Live'),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
