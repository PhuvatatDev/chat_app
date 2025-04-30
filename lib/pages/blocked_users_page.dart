import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});

  // chat & auth service
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  // show confirm unblock box
  void _showUnblockBox(BuildContext context, String userID) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Unblock User'),
              content: const Text('Are you sure you want to unblock this user?'),
              actions: [
                // cancel button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('cancel')),

                // unblock button
                TextButton(
                    onPressed: () {
                      chatService.unblockUser(userID);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("user unblocked")));
                    },
                    child: const Text('unblock'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get current user id
    String userID = authService.getCurrentUser()!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked Users'),
        actions: [],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: chatService.getBlockedUsersStream(userID),
        builder: (context, snapshot) {
          // errors..
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading..'),
            );
          }
          // loaging..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final blockedUsers = snapshot.data ?? [];

          // no users
          if (blockedUsers.isEmpty) {
            return const Center(
              child: Text('No Blocked Users'),
            );
          }
          // loading complete
          return ListView.builder(
            itemCount: blockedUsers.length,
            itemBuilder: (context, index) {
            final user = blockedUsers[index];
            return UserTile(
              text: user['email'],
              onTap: () => _showUnblockBox(context, user['uid']),
            );
          });
        },
      ),
    );
  }
}
