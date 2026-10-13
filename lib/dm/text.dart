import '../user_account.dart';

class Message {
  final User sender;
  final String text;
  final DateTime time;
  final bool isRead;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    this.isRead = false,
  });
}

// Example users (other than kimmy)
final User buddy = users.firstWhere((u) => u.username == "buddycat");
final User melanie = users.firstWhere((u) => u.username == "melanieee");
final User maxey = users.firstWhere((u) => u.username == "maxeytt");

// Example messages list
final List<Message> demoMessages = [
  Message(
    sender: maxey,
    text: "Just finished my nap 😴",
    time: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  Message(
    sender: buddy,
    text: "Let's meet at the park!",
    time: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  Message(
    sender: melanie,
    text: "Do you know a good cat sitter??",
    time: DateTime.now().subtract(const Duration(hours: 12)),
  ),
];
