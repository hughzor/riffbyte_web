import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/app_user.dart';
import '../services/firestore_service.dart';

class UserProvider extends ChangeNotifier {
  final FirestoreService _firestore = FirestoreService();

  AppUser? _user;
  AppUser? get user => _user;

  bool _loading = true;
  bool get loading => _loading;

  late final StreamSubscription<User?> _authSubscription;

  UserProvider() {
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((
      firebaseUser,
    ) async {
      if (firebaseUser == null) {
        _user = null;
        _loading = false;
        notifyListeners();
        return;
      }

      _loading = true;
      notifyListeners();

      _user = await _firestore.getCurrentUser(firebaseUser.uid);

      _loading = false;
      notifyListeners();
    });
  }

  Future<void> loadUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser == null) return;

    _user = await _firestore.getCurrentUser(firebaseUser.uid);

    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
