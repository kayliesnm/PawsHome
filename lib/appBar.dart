import 'package:flutter/material.dart';
import '../signin/signin.dart';

class AppLogoBar extends StatelessWidget implements PreferredSizeWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final BuildContext parentContext;

  const AppLogoBar({
    Key? key,
    required this.themeMode,
    required this.onToggleTheme,
    required this.parentContext,
  }) : super(key: key);

  void _signOut(BuildContext context) {
    final theme = Theme.of(context); 

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: theme.cardColor, 
        title: Text(
          'Sign Out',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        content: Text(
          'Are you sure you want to sign out?',
          style: theme.textTheme.bodyMedium,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            style: TextButton.styleFrom(
              foregroundColor: theme.primaryColor, 
            ),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => SignInPage(
                    themeMode: themeMode,
                    onToggleTheme: onToggleTheme,
                  ),
                ),
                (route) => false,
              );
            },
            style: TextButton.styleFrom(
              foregroundColor:
                  theme.primaryColor, 
            ),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // toolbarHeight: 62,
      centerTitle: true,
      leading: IconButton(
        tooltip: 'Sign Out',
        icon: const Icon(Icons.logout_rounded, size: 20),
        onPressed: () => _signOut(context),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/barlogo.png', height: 42, fit: BoxFit.contain),
          const SizedBox(width: 8),
          const Text(
            'PawsHome',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Theme',
          padding: const EdgeInsets.symmetric(horizontal: 20),
          icon: Icon(
            themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            size: 20,
          ),
          onPressed: onToggleTheme,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(62);
}
