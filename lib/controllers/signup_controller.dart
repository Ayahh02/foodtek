
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DateTime? selectedDate;

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    bool emailValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value);
    if (!emailValid) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r"[A-Z]").hasMatch(value)) {
      return 'Must contain at least one uppercase letter';
    }
    if (!RegExp(r"[a-z]").hasMatch(value)) {
      return 'Must contain at least one lowercase letter';
    }
    if (!RegExp(r"[0-9]").hasMatch(value)) {
      return 'Must contain at least one number';
    }

  return null;
}

Future<void> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }
}

void handleSubmit() {
  if (formKey.currentState?.validate() ?? false) {
    print("Signup Successful");
  }
}
}
