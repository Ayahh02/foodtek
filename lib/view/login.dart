import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png", height: 80),
                  SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text("Don't have an account? Sign Up", style: TextStyle(color: Colors.green)),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: emailController,
                              validator: (value) => value!.isEmpty ? "Enter your email" : null,
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) => value!.isEmpty ? "Enter your password" : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(value: false, onChanged: (value) {}),
                                    Text("Remember me"),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Forgot Password?", style: TextStyle(color: Colors.green)),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {

                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Log In", style: TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                            SizedBox(height: 15),
                            Center(child: Text("Or")),
                            SizedBox(height: 15),
                            _socialLoginButton("Continue with Google", "assets/images/google.png"),
                            _socialLoginButton("Continue with Facebook", "assets/images/facebook.png"),
                            _socialLoginButton("Continue with Apple", "assets/images/apple.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialLoginButton(String text, String iconPath) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.asset(iconPath, height: 24),
        label: Text(text, style: TextStyle(fontSize: 16)),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
