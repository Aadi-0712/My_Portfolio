import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  final String email = 'yerokaraditya@gmail.com';
  final String phone = '+91 9588692349';
  final String location = 'Kolhapur, India';
  final String github = 'https://github.com/Aadi-0712';
  final String linkedin = 'https://linkedin.com/in/aditya-yerokar';

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildContactCard({
    required IconData icon,
    required String text,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return Card(
      color: Colors.black.withOpacity(0.2),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 28),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text("Contact Me", style: TextStyle(fontFamily: 'Montserrat')),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.contact_mail, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Let's Get in Touch!",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Email
            buildContactCard(
              icon: Icons.email,
              text: email,
              iconColor: Colors.orangeAccent,
              onTap: () => _launchUrl('mailto:$email'),
            ),
            const SizedBox(height: 15),

            // Phone
            buildContactCard(
              icon: Icons.phone,
              text: phone,
              iconColor: Colors.greenAccent,
              onTap: () => _launchUrl('tel:$phone'),
            ),
            const SizedBox(height: 15),

            // Location
            buildContactCard(
              icon: Icons.location_on,
              text: location,
              iconColor: Colors.redAccent,
            ),
            const SizedBox(height: 30),

            const Text(
              "Connect with me",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 15),

            // Social
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.code),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () => _launchUrl(github),
                  tooltip: 'GitHub',
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.business_center),
                  iconSize: 30,
                  color: Colors.lightBlueAccent,
                  onPressed: () => _launchUrl(linkedin),
                  tooltip: 'LinkedIn',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
