import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String link;
  final List<String> techStack;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.link,
    required this.techStack,
  });

  factory ProjectModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProjectModel(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      link: data['link'] ?? '',
      techStack: List<String>.from(data['techStack'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'link': link,
      'techStack': techStack,
    };
  }
}
