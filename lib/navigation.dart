import 'package:flutter/material.dart';
import '../user_account.dart';
import 'profiles/user_profile.dart';
import 'profiles/friend_profile.dart';
import '../search/search_page.dart';
import '../dm/messages.dart';
import 'add_post/add_post.dart';
import 'appBar.dart';
import 'timeline/timeline.dart';

class NavBar extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final User currentUser; // logged-in user

  const NavBar({
    Key? key,
    required this.themeMode,
    required this.onToggleTheme,
    required this.currentUser,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  User? _currentViewedUser;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      const TimelinePage(),
      SearchPage(
        themeMode: widget.themeMode,
        onToggleTheme: widget.onToggleTheme,
        onUserTap: (user) {
          setState(() {
            _currentViewedUser = user;
          });
        },
      ),
      UserProfilePage(user: widget.currentUser), // logged-in user
      AddPostPage(currentUser: widget.currentUser),
      const MessagesPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppLogoBar(
        themeMode: widget.themeMode,
        onToggleTheme: widget.onToggleTheme,
        parentContext: context,
      ),
      body: _currentViewedUser != null
          ? FriendProfilePage(
              user: _currentViewedUser!,
              themeMode: widget.themeMode,
              onToggleTheme: widget.onToggleTheme,
              onBack: () {
                setState(() {
                  _currentViewedUser = null;
                });
              },
            )
          : IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _currentViewedUser = null;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.messenger_rounded), label: ''),
        ],
      ),
    );
  }
}
