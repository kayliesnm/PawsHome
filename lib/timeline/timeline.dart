import 'package:flutter/material.dart';
import 'dart:math';
import '../user_account.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({Key? key}) : super(key: key);

  // Random date
  String randomDate() {
    final random = Random();
    final daysAgo = random.nextInt(30) + 1; // 1 to 30 days ago
    final date = DateTime.now().subtract(Duration(days: daysAgo));
    return "${date.month}/${date.day}/${date.year}";
  }

  // Generate random likes and comments
  int randomNumber(int max) => Random().nextInt(max) + 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> allPosts = [];
    for (var user in users) {
      for (var post in user.posts) {
        allPosts.add({'user': user, 'post': post, 'date': randomDate()});
      }
    }

    // Shuffle posts
    allPosts.shuffle();

    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: allPosts.length,
      itemBuilder: (context, index) {
        final postData = allPosts[index];
        final User user = postData['user'];
        final String postImage = postData['post'];
        final String date = postData['date'];
        final int likes = randomNumber(100); // random likes
        final int comments = randomNumber(50); // random comments
        final String caption = user.bio;

        return Card(
          color: theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user.profilePic),
                    ),
                    title: Text(
                      user.accountName,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "@${user.username} • $date",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                  
                  Positioned(
                    top: 5,
                    right: 5,
                    child: PopupMenuButton(
                      icon: Icon(
                        Icons.error_outline_rounded,
                        color: theme.iconTheme.color,
                        size: 20,
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'report',
                          child: Text('Report'),
                        ),
                      ],
                      onSelected: (value) {
                        if (value == 'report') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Post reported")),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),

              // Post image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    postImage,
                    width: 450,
                    height: 450,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Caption + share icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${user.accountName} • ",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: caption,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.ios_share_rounded,
                              color: theme.iconTheme.color,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Likes and comments
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: 20,
                          color: theme.iconTheme.color,
                        ),
                        const SizedBox(width: 4),
                        Text("$likes likes", style: theme.textTheme.bodySmall),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.comment_outlined,
                          size: 17,
                          color: theme.iconTheme.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "$comments comments",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
