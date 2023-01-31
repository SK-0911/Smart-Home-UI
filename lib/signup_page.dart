import 'package:flutter/material.dart';
import 'package:smart_home_ui/home_page.dart';
import 'package:smart_home_ui/button.dart';
import 'package:smart_home_ui/login_page/textfield.dart';
import 'package:smart_home_ui/login_page/square.dart';

import 'login_page/login_page.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 10),

              //logo
              const Icon(
                Icons.account_box,
                size: 100,
              ),

              const SizedBox(height: 15),

              //Let's get started!
              Text(
                "Let's get started!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,

                ),
              ),

              const SizedBox(height: 20),

              //Full Name text-field
              MyTextField(
                controller: fullNameController,
                hintText: 'Full Name',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              //email textfield
              MyTextField(
                controller: emailController,
                hintText: 'E-mail',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              //Password textfield
              MyTextField(
                controller: pwdController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),

              //Confirm Password text-field
              MyTextField(
                controller: confirmPwdController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              // TODO: T&C Agree Checkbox

              const SizedBox(height: 20),

              // Sign Up button
              SignUpButton(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return const HomePage();
                      }
                  ),
                ),
              ),

              const SizedBox(height: 30),

              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //google + apple sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Google logo
                  squareTile(imgPath: 'lib/icons/google.png'),

                  SizedBox(width: 10),

                  // Apple logo
                  squareTile(imgPath: 'lib/icons/apple.png')
                ],
              ),

              const SizedBox(height: 20),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a Member? ",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context){
                            return LoginPage();
                          }
                      ),
                    ),
                    child: const Text(
                      "Login Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

