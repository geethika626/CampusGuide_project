import 'package:flutter/material.dart';

class VisitPlanDetailsScreen extends StatelessWidget {
  final String serviceName;

  const VisitPlanDetailsScreen({
    super.key,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Visit Plan'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Service title
            Text(
              serviceName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Here is everything you need for your visit.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // Destination
            _infoCard(
              Icons.location_on,
              'Where to go',
              'Academic Office\nBlock B - Ground Floor',
            ),

            // Office hours
            _infoCard(
              Icons.access_time,
              'Office hours',
              '9:00 AM - 4:00 PM',
            ),

            // Estimated time
            _infoCard(
              Icons.timer,
              'Estimated visit time',
              '20 - 30 minutes',
            ),

            const SizedBox(height: 20),

            const Text(
              'Steps to Complete',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _stepCard(
              1,
              'Get the application form',
              'Collect the form from the Academic Office.',
            ),

            _stepCard(
              2,
              'Fill the application',
              'Enter your student details carefully.',
            ),

            _stepCard(
              3,
              'Pay the required fee',
              'Complete the payment at the designated counter.',
            ),

            _stepCard(
              4,
              'Submit the application',
              'Submit the completed form and documents.',
            ),

            const SizedBox(height: 20),

            const Text(
              'Before You Go',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _checkItem('Student ID Card'),
            _checkItem('Passport-size photograph'),
            _checkItem('Required application documents'),
            _checkItem('Fee amount'),

            const SizedBox(height: 25),

            // Start route button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Route started! Follow the campus directions.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.navigation),
                label: const Text(
                  'Start Route',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          size: 32,
          color: Colors.indigo,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(value),
        ),
      ),
    );
  }

  Widget _stepCard(
    int number,
    String title,
    String description,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('$number'),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
      ),
    );
  }

  Widget _checkItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}