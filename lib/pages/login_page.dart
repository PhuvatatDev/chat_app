import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  // email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

    // tap to go to register page
  final void Function()? onTap;
  
  LoginPage({
    super.key,
    required this.onTap});



  // login methode
  void login (){
    // doing later with auth
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
            Icon(Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(height: 50),
        
            // welcome back message
            Text("Welcome back, you've been missed!", style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),),

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

              SizedBox(height: 25),
        
            // login button
            MyButton(
              text: "Login",
              onTap: login),

              SizedBox(height: 25),
        
            // register now 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?", 
                style: TextStyle(color: Theme.of(context).colorScheme.primary
                ),),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                  "Register Now", 
                style: TextStyle(fontWeight: FontWeight.bold, 
                color: Theme.of(context).colorScheme.inversePrimary,)),
                ),
                
              ],
            )
          ],
        ),
      ),

    );
  }
}
