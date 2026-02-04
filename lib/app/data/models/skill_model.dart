import 'package:cloud_firestore/cloud_firestore.dart';

class SkillModel {
  final String id;
  final String name;
  final String iconUrl;
  final double proficiency; // 0.0 to 1.0

  SkillModel({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.proficiency,
  });

  factory SkillModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SkillModel(
      id: doc.id,
      name: data['name'] ?? '',
      iconUrl: data['iconUrl'] ?? '',
      proficiency: (data['proficiency'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'iconUrl': iconUrl, 'proficiency': proficiency};
  }
}
