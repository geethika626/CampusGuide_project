import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/visit_planner_screen.dart';
import 'screens/lost_mode_screen.dart';
import 'screens/report_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/service_category_screen.dart';
import 'theme/app_theme.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const CampusGuideApp(),
    ),
  );
}

class CampusGuideApp extends StatelessWidget {
  const CampusGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusGuide',

      // Theme support
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // Provider controls the theme
      themeMode: context.watch<ThemeProvider>().isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,

      // Login is the first screen
      home: const LoginScreen(),

      // Home route
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusGuide'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Hello! 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'What do you need help with today?',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              // Smart Visit Planner
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.event_note,
                    size: 35,
                    color: Colors.indigo,
                  ),
                  title: const Text(
                    'Smart Visit Planner',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Plan your college office visit step by step',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const VisitPlannerScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // I'm Lost
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.navigation,
                    size: 35,
                    color: Colors.green,
                  ),
                  title: const Text(
                    "I'm Lost",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Find your way around the campus',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LostModeScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // Report a Problem
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.report_problem,
                    size: 35,
                    color: Colors.orange,
                  ),
                  title: const Text(
                    'Report a Problem',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'Report issues around the campus',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ReportScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Find a Service',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  _serviceCard(
                    context,
                    Icons.school,
                    'Academic',
                  ),
                  _serviceCard(
                    context,
                    Icons.receipt,
                    'Fees',
                  ),
                  _serviceCard(
                    context,
                    Icons.assignment,
                    'Exams',
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  _serviceCard(
                    context,
                    Icons.directions_bus,
                    'Transport',
                  ),
                  _serviceCard(
                    context,
                    Icons.health_and_safety,
                    'Health',
                  ),
                  _serviceCard(
                    context,
                    Icons.settings,
                    'Technical',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        // Added Profile navigation
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Navigate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return Expanded(
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServiceCategoryScreen(
                  category: title,
                ),
              ),
            );
          },

          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 30,
                ),

                const SizedBox(height: 8),

                Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}