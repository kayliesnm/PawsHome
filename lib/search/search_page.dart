import 'package:flutter/material.dart';
import '../user_account.dart';

class SearchPage extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final ValueChanged<User> onUserTap;

  const SearchPage({
    Key? key,
    required this.themeMode,
    required this.onToggleTheme,
    required this.onUserTap,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<User> _filteredUsers = users;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = users.where((user) {
        return user.accountName.toLowerCase().contains(query) ||
            user.username.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search by account name or username',
              prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: theme.primaryColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: _filteredUsers.isEmpty
              ? const Center(child: Text('No users found'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = _filteredUsers[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(user.profilePic),
                      ),
                      title: Text(user.accountName, style: theme.textTheme.bodyLarge),
                      subtitle: Text('@${user.username}', style: theme.textTheme.bodyMedium),
                      onTap: () {
                        widget.onUserTap(user);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
