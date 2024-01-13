import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pw_auth/components/my_button.dart';
import 'package:pw_auth/components/my_textfield.dart';
import 'package:pw_auth/components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text Controller
  final emailController = TextEditingController();
  final paswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // Sign Up
  void signUserUp() async {
    // Loading Circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // Create user
    try {
      // Confirm password
      if (paswordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: paswordController.text);
      } else {
        // Pop the lodaer
        Navigator.pop(context);
        errorMessage("Password don't match");
      }
    } on FirebaseAuthException catch (e) {
      // Pop the lodaer
      Navigator.pop(context);
      errorMessage(e.code);
    }
  }

  // Error Message Dialog
  void errorMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(errorMessage));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),

                  // App Logo
                  const Icon(
                    Icons.person_2_outlined,
                    size: 55,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Message
                  const Text(
                    "Welcome New User",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // Textfield: email
                  MyTextField(
                    controller: emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Textfield: Password
                  MyTextField(
                    controller: paswordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Textfield: confirm password
                  MyTextField(
                    controller: confirmpasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // Button: Sign-Up
                  MyButton(
                    text: "Sign Up",
                    onTap: signUserUp,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // Message
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.green[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "or continue with",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.green[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // Google Sign-In
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imagePath: 'lib/images/google-logo.png')
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // Button: Sign-up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already a member?',
                          style: TextStyle(color: Colors.grey[700])),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('Sign In Now',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
