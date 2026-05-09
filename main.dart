import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: const ProfilePage(),
    );
  }
}

/* ================= PERSONAL CV PAGE ================= */

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final String name = 'Sania Malik';
  final String email = 'saniamalik1204@gmail.com';
  final String phone = '+923276176799';
  final String tagline = 'Computer Science Student & Flutter Enthusiast';

  int selectedTheme = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Professional CV'),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _getAppBarGradient(),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: _getBackgroundDecoration(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Theme Selector Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGradientButton(
                        'Simple',
                        [Colors.pink.shade400, Colors.pink.shade600],
                        0),
                    const SizedBox(width: 10),
                    _buildGradientButton(
                        'Modern',
                        [Colors.cyan.shade400, Colors.blue.shade600],
                        1),
                    const SizedBox(width: 10),
                    _buildGradientButton(
                        'Bright',
                        [Colors.amber.shade300, Colors.yellow.shade500],
                        2),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Hobby CV Button
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HobbyPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 14),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.auto_awesome,
                              color: Colors.white, size: 22),
                          SizedBox(width: 10),
                          Text(
                            'View My Hobby CV',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Profile Card with Animation
              _buildAnimatedProfileCard(),
              const SizedBox(height: 20),

              // About Card
              _buildAboutCard(),
              const SizedBox(height: 20),

              // Skills Card
              _buildSkillsCard(),
              const SizedBox(height: 20),

              // Experience Card
              _buildExperienceCard(),
              const SizedBox(height: 20),

              // Contact Card
              _buildContactCard(),
              const SizedBox(height: 20),

              // Download CV Button
              _buildDownloadButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedProfileCard() {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      ),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey[50]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              // Profile Picture with Border
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: _getAccentColors(),
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(3),
                child: Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage('images/img.png'),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),

              // Tagline with Icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: _getAccentColors()[0].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _getAccentColors()[0].withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      size: 18,
                      color: _getAccentColors()[0],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tagline,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutCard() {
    return _buildCardContainer(
      icon: Icons.person_outline,
      title: 'About Me',
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getAccentColors()[0].withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _getAccentColors()[0].withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: const Text(
              'Motivated Computer Science student with a strong interest in software development and modern technologies. Skilled in Java programming, web development, and Flutter for mobile applications. Passionate about learning new tools and building creative digital solutions.',
              style: TextStyle(
                fontSize: 16,
                height: 1.8,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCard() {
    List<Map<String, dynamic>> skills = [
      {
        'name': 'Java Programming',
        'icon': Icons.code,
        'color': Colors.deepOrange,
        'level': '85%'
      },
      {
        'name': 'Flutter Development',
        'icon': Icons.phone_android,
        'color': Colors.blue,
        'level': '80%'
      },
      {
        'name': 'Web Development',
        'icon': Icons.language,
        'color': Colors.green,
        'level': '75%'
      },
      {
        'name': 'Problem Solving',
        'icon': Icons.psychology,
        'color': Colors.purple,
        'level': '88%'
      },
    ];

    return _buildCardContainer(
      icon: Icons.star_border,
      title: 'Technical Skills',
      child: Column(
        children: skills.map((skill) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: skill['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: skill['color'].withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: skill['color'],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: skill['color'].withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(skill['icon'],
                          color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        skill['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: skill['color'],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        skill['level'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: int.parse(skill['level']
                        .replaceAll('%', '')) /
                        100,
                    minHeight: 6,
                    backgroundColor: skill['color'].withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(skill['color']),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExperienceCard() {
    return _buildCardContainer(
      icon: Icons.work_outline,
      title: 'Academic Experience',
      child: Column(
        children: [
          _buildExperienceItem(
            'BS Computer Science Student',
            'University Coursework',
            '2024 - Present',
            Icons.school,
            Colors.blue,
          ),
          _buildDivider(),
          _buildExperienceItem(
            'Flutter App Development',
            'Personal / Academic Projects',
            '2025 - Present',
            Icons.mobile_screen_share,
            Colors.teal,
          ),
          _buildDivider(),
          _buildExperienceItem(
            'Web Development',
            'HTML, CSS, JavaScript',
            '2024 - Present',
            Icons.language,
            Colors.green,
          ),
          _buildDivider(),
          _buildExperienceItem(
            'Java Programming',
            'Object-Oriented Programming',
            '2024 - Present',
            Icons.code,
            Colors.deepOrange,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
      String title,
      String company,
      String period,
      IconData icon,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              period,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(
        color: Colors.grey.withOpacity(0.2),
        thickness: 1,
      ),
    );
  }

  Widget _buildContactCard() {
    return _buildCardContainer(
      icon: Icons.contact_mail_outlined,
      title: 'Contact Information',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildContactItem(
            Icons.email,
            email,
            Colors.blue,
            'Email',
          ),
          Container(
            width: 1,
            height: 60,
            color: Colors.grey.withOpacity(0.2),
          ),
          _buildContactItem(
            Icons.phone,
            phone,
            Colors.green,
            'Phone',
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
      IconData icon,
      String text,
      Color color,
      String label,
      ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _getAccentColors(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: _getAccentColors()[0].withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('CV Download Feature Coming Soon!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.download, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Download CV as PDF',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContainer({
    IconData? icon,
    String? title,
    Widget? child,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getAccentColors()[0].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: _getAccentColors()[0],
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            child!,
          ],
        ),
      ),
    );
  }

  Widget _buildGradientButton(String text, List<Color> colors, int themeIndex) {
    bool isSelected = selectedTheme == themeIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTheme = themeIndex;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: Colors.white, width: 2.5)
              : null,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: colors[0].withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            shadows: [
              Shadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _getAccentColors() {
    switch (selectedTheme) {
      case 1:
      // Modern - Sky Blue
        return [Colors.cyan.shade400, Colors.blue.shade600];
      case 2:
      // Bright - Light Yellow
        return [Colors.amber.shade300, Colors.yellow.shade500];
      default:
      // Simple - Pinkish
        return [Colors.pink.shade400, Colors.pink.shade600];
    }
  }

  List<Color> _getAppBarGradient() {
    switch (selectedTheme) {
      case 1:
      // Modern - Sky Blue
        return [Colors.cyan.shade700, Colors.blue.shade800];
      case 2:
      // Bright - Light Yellow
        return [Colors.amber.shade600, Colors.yellow.shade700];
      default:
      // Simple - Pinkish
        return [Colors.pink.shade700, Colors.pink.shade900];
    }
  }

  BoxDecoration _getBackgroundDecoration() {
    switch (selectedTheme) {
      case 1:
      // Modern - Sky Blue
        return BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan.shade50, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
      case 2:
      // Bright - Light Yellow
        return BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber.shade50, Colors.yellow.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
      default:
      // Simple - Pinkish
        return BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.pink.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
    }
  }
}

/* ================= HOBBY PAGE ================= */

class HobbyPage extends StatelessWidget {
  const HobbyPage({super.key});

  final String name = "Sania Malik";
  final String intro =
      "I am a Computer Science student who enjoys exploring technology and creative activities. Apart from academics, I love sketching, designing, and learning new skills.";

  final List<Map<String, dynamic>> hobbies = const [
    {
      "name": "Coding",
      "icon": Icons.code,
      "color": Colors.blue,
      "description": "Writing efficient and clean code"
    },
    {
      "name": "Reading Books",
      "icon": Icons.menu_book,
      "color": Colors.green,
      "description": "Expanding knowledge through reading"
    },
    {
      "name": "Learning New Technologies",
      "icon": Icons.computer,
      "color": Colors.orange,
      "description": "Staying updated with tech trends"
    },
    {
      "name": "Watching Tech Videos",
      "icon": Icons.ondemand_video,
      "color": Colors.red,
      "description": "Understanding concepts through videos"
    },
    {
      "name": "Listening to Music",
      "icon": Icons.music_note,
      "color": Colors.purple,
      "description": "Enjoying music during study sessions"
    },
    {
      "name": "Sketching",
      "icon": Icons.brush,
      "color": Colors.teal,
      "description": "Expressing creativity through art"
    },
    {
      "name": "Designing",
      "icon": Icons.design_services,
      "color": Colors.pink,
      "description": "Creating beautiful UI/UX designs"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Hobby CV"),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade700, Colors.purple.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.pink.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Card
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey[50]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.purple, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(3),
                        child: Hero(
                          tag: 'profile',
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage:
                            const AssetImage('images/img.png'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.purple.withOpacity(0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          intro,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Hobbies Card
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey[50]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.purple,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "My Hobbies",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Hobbies Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: hobbies.length,
                        itemBuilder: (context, index) {
                          final hobby = hobbies[index];
                          return _buildHobbyCard(hobby);
                        },
                      ),

                      const SizedBox(height: 20),

                      // Hobbies List
                      const Text(
                        "Detailed Hobbies",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...hobbies.map((hobby) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: hobby['color'].withOpacity(0.1),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: hobby['color'].withOpacity(0.2),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: hobby['color'],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: hobby['color'].withOpacity(0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(hobby['icon'],
                                      color: Colors.white, size: 20),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hobby['name'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        hobby['description'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHobbyCard(Map<String, dynamic> hobby) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hobby['color'].withOpacity(0.1),
            hobby['color'].withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hobby['color'].withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: hobby['color'].withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: hobby['color'],
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: hobby['color'].withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              hobby['icon'],
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            hobby['name'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}