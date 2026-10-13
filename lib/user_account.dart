class User {
  final String username;
  final String email;
  final String accountName;
  final String password; 
  final String profilePic;
  final String bio;
  final List<String> posts;

  User({
    required this.username,
    required this.email,
    required this.accountName,
    required this.password,
    required this.bio,
    this.profilePic = 'assets/kim.png',
    this.posts = const [],
  });
}

// demo user
final demoUser = User(
  username: 'kimmy123',
  email: 'kimmy@example.com',
  accountName: 'Kimmy',
  password: 'password123',
  profilePic: 'assets/kim.png',
  bio: 'Love chasing cars and eating ice cubes! 🐾',
  posts: [
    'assets/kim1.png',
    'assets/kim2.png',
    'assets/kim3.png',
  ]
);

// List of users
final List<User> users = [
  demoUser,
  User(username: 'melanieee', profilePic: 'assets/mela.png', email: 'melanie@example.com', accountName: 'Melaniethecat', password: 'melaniepass', bio: 'Nap enthusiast and laser pointer chaser.',  posts: [
    'assets/mela1.png',
    'assets/mela2.png',
    'assets/mela3.png',
  ]),
  User(username: 'buddycat', profilePic: 'assets/buddy.png', email: 'buddy@example.com', accountName: 'Buddy', password: 'buddypass', bio: 'Always up for an adventure!',   posts: [
    'assets/buddy1.png',
    'assets/buddy2.png',
    'assets/buddy3.png',
  ]),
  User(username: 'maxeytt', profilePic: 'assets/max.png', email: 'maxey@example.com', accountName: 'Tyrese Maxey', password: 'maxeypass', bio: 'Living life one paw at a time.',
    posts: [
    'assets/max1.png',
    'assets/max2.png',
    'assets/max3.png',
  ]),
];
