import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/app_user.dart';
import '../models/software_release.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String email,
    required String displayName,
  }) async {
    await _db.collection('users').doc(uid).set({
      "email": email,
      "displayName": displayName,
      "createdAt": FieldValue.serverTimestamp(),
      "products": <String>[],
      "licenses": <String>[],
      "role": "user",
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) {
    return _db.collection('users').doc(uid).get();
  }

  Future<AppUser> getCurrentUser(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();

    return AppUser.fromFirestore(doc.id, doc.data()!);
  }

  Future<void> updateDisplayName({
    required String uid,
    required String displayName,
  }) async {
    await _db.collection("users").doc(uid).update({"displayName": displayName});
  }

  Future<void> addProduct({
    required String uid,
    required String product,
  }) async {
    await _db.collection("users").doc(uid).update({
      "products": FieldValue.arrayUnion([product]),
    });
  }

  Future<void> addLicense({
    required String uid,
    required String license,
  }) async {
    await _db.collection("users").doc(uid).update({
      "licenses": FieldValue.arrayUnion([license]),
    });
  }

  Future<SoftwareRelease> getRelease(String productId) async {
    final doc = await _db.collection("software").doc(productId).get();

    return SoftwareRelease.fromFirestore(doc.data()!);
  }
}
