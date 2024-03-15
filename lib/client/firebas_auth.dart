// This class provides methods for authentication using Firebase Auth.
import 'dart:async'; // Importing asynchronous Dart library.

import 'package:firebase_auth/firebase_auth.dart'; // Importing Firebase Auth package.
import 'package:movie_app_example/models/application_user.dart'; // Importing application user model.

import 'firebase_database_services.dart'; // Importing Firebase database services.

class FirebaseAuthService {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Initializing FirebaseAuth instance.

  // Get the current user's authentication state.
  Stream<User?> get user {
    // signInWithEmailAndPassword('mgmaheshnew@gmail.com', 'pfU3LGjq5vAxKtF');
    return _auth
        .authStateChanges(); // Returning authentication state changes stream.
  }

  // Method to sign in anonymously.
  Future<User?> signInAnon() async {
    try {
      // Signing in anonymously.
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!; // Getting user from result.
      return user; // Returning user.
    } catch (e) {
      print(e.toString()); // Printing error if any occurs.
      return null; // Returning null if error occurs.
    }
  }

  // Method to sign in with email and password.
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Signing in with email and password.
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!; // Getting user from result.
      return user; // Returning user.
    } catch (error) {
      print(error.toString()); // Printing error if any occurs.
      return null; // Returning null if error occurs.
    }
  }

  // Method to edit user profile.
  Future<User?> editUser(
      {required String email,
      required String password,
      required String displayName,
      required String photoURL}) async {
    try {
      // Signing in with email and password.
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!; // Getting user from result.

      // Updating user profile.
      await user?.updateProfile(displayName: displayName, photoURL: photoURL);

      return user; // Returning user.
    } catch (error) {
      print(error.toString()); // Printing error if any occurs.
      return null; // Returning null if error occurs.
    }
  }

  // Method to register with email and password.
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Creating user with email and password.
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!; // Getting user from result.
      return user; // Returning user.
    } catch (error) {
      print(error.toString()); // Printing error if any occurs.
      return null; // Returning null if error occurs.
    }
  }

  // Method to sign out.
  Future signOut() async {
    try {
      return await _auth.signOut(); // Signing out.
    } catch (error) {
      print(error.toString()); // Printing error if any occurs.
      return null; // Returning null if error occurs.
    }
  }
}
