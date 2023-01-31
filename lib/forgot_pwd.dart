import 'package:flutter/material.dart';
import 'package:smart_home_ui/button.dart';
import 'package:smart_home_ui/login_page/textfield.dart';


class ForgotPwd extends StatelessWidget {
  ForgotPwd({super.key});

  // email controller

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 10),

            //logo
            const Icon(
              Icons.password,
              size: 120,
            ),

            const SizedBox(height: 50),

            Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Enter the email address associated with your account",
               style: TextStyle(
                 fontSize: 15,
               ),
            ),

            const SizedBox(height: 20),

            MyTextField(
                controller: emailController,
                hintText: "Enter your E-mail",
                obscureText: false,
            ),

            const SizedBox(height: 20),

            // VerifyButton(onTap: )
          ],
        ),
      ),
    );
  }
}


    
    