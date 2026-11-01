
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyForm(),
  ));
}

class MyForm extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            // Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // Submit
            ElevatedButton(
              onPressed: () {

                if (nameController.text.isEmpty) {
                  print("Please enter your name");
                }
                else if (emailController.text.isEmpty) {
                  print("Please enter your email");
                }
                else if (passwordController.text.isEmpty) {
                  print("Please enter your password");
                }
                else if (passwordController.text.length < 6) {
                  print("Password must have 6 characters");
                }
                else {
                  print("Form is valid");
                }

              },

              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}