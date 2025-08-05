class Project {
  final String title;
  final String description;
  final String techStack;
  final String githubLink;
  final String? liveLink;

  Project({
    required this.title,
    required this.description,
    required this.techStack,
    required this.githubLink,
    this.liveLink,
  });
}
