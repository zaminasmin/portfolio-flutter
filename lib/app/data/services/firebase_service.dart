import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

class FirebaseService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirebaseService> init() async {
    return this;
  }

  Stream<List<ProjectModel>> getProjects() {
    return _firestore.collection('projects').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => ProjectModel.fromDocument(doc))
          .toList();
    });
  }

  Stream<List<SkillModel>> getSkills() {
    return _firestore.collection('skills').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => SkillModel.fromDocument(doc)).toList();
    });
  }
}
