import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../controllers/signup_controller.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SignupController();
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                    ),
                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(20),
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),

                            const Text("Full Name"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: controller.fullNameController,
                              validator: controller.validateFullName,
                              decoration: inputDecoration(),
                            ),
                            const SizedBox(height: 15),

                            const Text("Email"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: controller.emailController,
                              validator: controller.validateEmail,
                              decoration: inputDecoration(),
                            ),
                            const SizedBox(height: 15),

                            const Text("Birth Date"),
                            const SizedBox(height: 5),
                            GestureDetector(
                              onTap: () => controller.selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  decoration: inputDecoration().copyWith(
                                    hintText: controller.selectedDate == null
                                        ? 'Select Date'
                                        : '${controller.selectedDate!.toLocal()}'.split(' ')[0],
                                    suffixIcon: const Icon(Icons.calendar_today),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),

                            const Text("Phone Number"),
                            const SizedBox(height: 5),
                            IntlPhoneField(
                              decoration: inputDecoration(),
                              initialCountryCode: 'JO',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                            const SizedBox(height: 15),


                            const Text("Set Password"),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: controller.passwordController,
                              validator: controller.validatePassword,
                              obscureText: true,
                              decoration: inputDecoration(),
                            ),
                            const SizedBox(height: 25),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: controller.handleSubmit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),



                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    );
  }
}
