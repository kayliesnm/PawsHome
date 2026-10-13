import 'package:flutter/material.dart';
import '../user_account.dart';

class FriendProfilePage extends StatefulWidget {
  final User user;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onBack;

  const FriendProfilePage({
    Key? key,
    required this.user,
    required this.themeMode,
    required this.onToggleTheme,
    required this.onBack,
  }) : super(key: key);

  @override
  State<FriendProfilePage> createState() => _FriendProfilePageState();
}

class _FriendProfilePageState extends State<FriendProfilePage> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = widget.user;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: widget.onBack,
                  icon: Icon(Icons.arrow_back, color: theme.primaryColor),
                ),
              ),

              // Profile picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(user.profilePic),
              ),
              const SizedBox(height: 8),

              // Name
              Text(
                user.accountName,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),

              // Username
              Text(
                "@${user.username}",
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 8),

              // Follow Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFollowing
                      ? theme.iconTheme.color?.withOpacity(0.1)
                      : theme.primaryColor,
                  foregroundColor: isFollowing
                      ? theme.primaryColor
                      : theme.scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  elevation: 0,
                ),
                child: Text(isFollowing ? "Following" : "Follow"),
              ),
              const SizedBox(height: 12),

              // Bio
              SizedBox(
                width: double.infinity,
                child: Text(
                  user.bio,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              const Divider(),

              // Stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _Stat(label: "Posts", value: "3"),
                  _Stat(label: "Followers", value: "58"),
                  _Stat(label: "Following", value: "34"),
                ],
              ),

              const Divider(),
              const SizedBox(height: 12),

              // Posts Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: user.posts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      user.posts[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;

  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
