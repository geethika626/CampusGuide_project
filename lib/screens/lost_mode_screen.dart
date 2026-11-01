import 'package:flutter/material.dart';

class LostModeScreen extends StatefulWidget {
  const LostModeScreen({super.key});

  @override
  State<LostModeScreen> createState() => _LostModeScreenState();
}

class _LostModeScreenState extends State<LostModeScreen> {
  String currentLocation = 'Main Gate';
  String destination = 'Academic Office';

  final List<String> locations = [
    'Main Gate',
    'Canteen',
    'Library',
    'Block A',
    'Block B',
    'Academic Office',
    'Administration Office',
    'Principal Office',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("I'm Lost"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Find Your Way 🧭',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Select where you are and where you want to go.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'I am currently at',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: currentLocation,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.my_location),
              ),
              items: locations.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  currentLocation = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'I want to go to',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: destination,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              items: locations.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  destination = value!;
                });
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showRoute();
                },
                icon: const Icon(Icons.navigation),
                label: const Text(
                  'Show Route',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRoute() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Your Route 🧭'),
          content: Text(
            'Start from $currentLocation\n\n'
            '↓\n\n'
            'Follow the main campus path\n\n'
            '↓\n\n'
            'Reach $destination',
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Got it'),
            ),
          ],
        );
      },
    );
  }
}