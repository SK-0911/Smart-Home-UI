import 'package:flutter/material.dart';
import 'package:smart_home_ui/forgot_pwd.dart';
import 'package:smart_home_ui/home_page.dart';
import 'package:smart_home_ui/button.dart';
import 'package:smart_home_ui/login_page/textfield.dart';
import 'package:smart_home_ui/login_page/square.dart';
import '../signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final pwdController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const SizedBox(height: 50),

              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              //welcome back, you've been missed
              Text(
                "Welcome Back, you've been missed!",
                 style: TextStyle(
                   color: Colors.grey[700],
                   fontSize: 16,

                 ),
              ),

              const SizedBox(height: 25),

              //username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 25),

              //password textfield
              MyTextField(
                controller: pwdController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //forgot password
              GestureDetector(
                onTap: ()=> Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return ForgotPwd();
                      }
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey[600],
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              SignInButton(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return const HomePage();
                      }
                  ),
                ),
              ),

              const SizedBox(height: 50),

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

              const SizedBox(height: 25),

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

              const SizedBox(height: 30),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a Member? ",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context){
                            return SignUpPage();
                          }
                      ),
                    ),
                    child: const Text(
                      "Register Now",
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
