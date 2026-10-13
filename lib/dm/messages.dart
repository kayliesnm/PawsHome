import 'package:flutter/material.dart';
import '../user_account.dart';
import 'text.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Group messages by friend
    final Map<User, List<Message>> groupedMessages = {};
    for (var msg in demoMessages) {
      if (!groupedMessages.containsKey(msg.sender)) {
        groupedMessages[msg.sender] = [];
      }
      groupedMessages[msg.sender]!.add(msg);
    }

    final friends = groupedMessages.keys.toList();

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        final messages = groupedMessages[friend]!;

        // Get latest message
        final latestMessage = messages.last;

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(friend.profilePic),
          ),
          title: Text(friend.accountName, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
          subtitle: Text(
            latestMessage.text.length > 30
                ? "${latestMessage.text.substring(0, 30)}..."
                : latestMessage.text,
            style: theme.textTheme.bodyMedium,
          ),
          trailing: Text(
            _formatTime(latestMessage.time),
            style: theme.textTheme.bodySmall,
          ),
          onTap: () {
          },
        );
      },
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (now.difference(time).inDays == 0) {
      // Show HH:mm
      return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
    } else {
      // Show MM/dd
      return "${time.month}/${time.day}";
    }
  }
}
