class ProfileModel {
  final String name;
  final String role;
  final String currentProject;
  final String imageUrl;
  final String description;
  final SocialLinks socialLinks;

  const ProfileModel({
    required this.name,
    required this.role,
    required this.currentProject,
    required this.imageUrl,
    required this.description,
    required this.socialLinks,
  });
}

class SocialLinks {
  final String? hackerrank;
  final String? github;
  final String? linkedin;
  final String? instagram;
  final String? twitter;
  final String? facebook;

  const SocialLinks({
    this.hackerrank,
    this.github,
    this.linkedin,
    this.instagram,
    this.twitter,
    this.facebook,
  });
}



class ProfileConstants {
  static const ProfileModel samarthKulkarniProfile = ProfileModel(
    name: 'Samarth Kulkarni',
    role: 'Software Engineer',
    currentProject: 'Kindkart',
    imageUrl: 'https://avatars.githubusercontent.com/u/85547877?v=4',
    description: 'An engineer powered by curiosity!',
    socialLinks: SocialLinks(
      hackerrank: 'https://www.hackerrank.com/samrocks003',
      github: 'https://github.com/samrocks03',
      linkedin: 'https://www.linkedin.com/in/samarthvkulkarni',
    ),
  );
}