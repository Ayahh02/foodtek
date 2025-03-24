import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  Future<void> login(String email, String password) async {
    // Implement login logic (Firebase or custom)
    print("Logging in with $email and password: $password");
  }
}
