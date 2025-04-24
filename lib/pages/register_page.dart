import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //  Rendre la méthode async
  Future<void> register(BuildContext context) async {
    final auth = AuthService();

    if (_pwController.text == _confirmPwController.text) {
      try {
        // Attendre la réponse de Firebase
        await auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match! Please fix it."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(height: 50),

            // welcome back message
            Text(
              "Let's create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 25),

            // email textfield
            MyTextFiled(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            SizedBox(height: 10),

            // pw Textfield
            MyTextFiled(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            SizedBox(height: 10),

            // confirm pw textfield
            MyTextFiled(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
            ),

            SizedBox(height: 25),

            // login button
            MyButton(text: "Register", onTap: () => register(context)),

            SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
