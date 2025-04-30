import 'package:chat_app/services/chat/chat_service.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageID;
  final String userID;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.isCurrentUser,
      required this.messageID,
      required this.userID});

  // show options
  void _showOptions(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: [
              //report message button
              ListTile(
                leading: const Icon(Icons.flag),
                title: const Text('Report'),
                onTap: () {
                  Navigator.pop(context);
                  _reportMessage(context, messageId, userId);
                },
              ),
              //block user button
              ListTile(
                leading: const Icon(Icons.block),
                title: const Text('Block'),
                onTap: () {
                  Navigator.pop(context);
                  _blockUser(context, userID);
                },
              ),
              // cancel button
              ListTile(
                leading: const Icon(Icons.cancel),
                title: const Text('Cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ));
        });
  }

  // report message
  void _reportMessage(BuildContext context, String messageID, String userID) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Report Message'),
              content:
                  const Text('Are you sur you want to report this message?'),
              actions: [
                // cancel button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('cancel')),

                // report button
                TextButton(
                    onPressed: () {
                      ChatService().reportUser(messageID, userID);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Message Roported')));
                    },
                    child: const Text('report')),
              ],
            ));
  }

  // block user
  void _blockUser(BuildContext context, String userID) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Block User'),
              content:
                  const Text('Are you sur you want to block this user?'),
              actions: [
                // cancel button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('cancel')),

                // block button
                TextButton(
                    onPressed: () {
                      ChatService().blockUser(userID);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(' User Blocked Succesfull')));
                    },
                    child: const Text('block')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // light mode vs dark mode for correct bubble colors
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return GestureDetector(
      onLongPress: () {
        if (!isCurrentUser) {
          // show options
          _showOptions(context, messageID, userID);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isCurrentUser
                ? (isDarkMode ? Colors.blueGrey : Colors.green.shade500)
                : (isDarkMode ? Colors.lightBlue : Colors.blueGrey)),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Text(
          message,
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
