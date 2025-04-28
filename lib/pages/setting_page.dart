import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 4,
          title: Padding(
            padding: EdgeInsets.only(top: 12),
            child: const Text(
              "Setting Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: 
          BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // dark mode
              const Text('Dark mode'),

              // switch toggle
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
                onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                )
            ],
          ),
        ),
    );
  }
}