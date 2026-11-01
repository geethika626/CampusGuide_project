import 'package:flutter/material.dart';
import 'visit_plan_details_screen.dart';

class VisitPlannerScreen extends StatefulWidget {
  const VisitPlannerScreen({super.key});

  @override
  State<VisitPlannerScreen> createState() => _VisitPlannerScreenState();
}

class _VisitPlannerScreenState extends State<VisitPlannerScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> services = [
    {
      'icon': Icons.description,
      'title': 'Bonafide Certificate',
      'location': 'Academic Office',
    },
    {
      'icon': Icons.badge,
      'title': 'Student ID Card',
      'location': 'Administration Office',
    },
    {
      'icon': Icons.school,
      'title': 'Scholarship',
      'location': 'Student Welfare Office',
    },
    {
      'icon': Icons.assignment,
      'title': 'Transfer Certificate',
      'location': 'Academic Office',
    },
  ];

  List<Map<String, dynamic>> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices = services;
  }

  void searchServices(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filteredServices = services;
      } else {
        filteredServices = services.where((service) {
          final title = service['title'].toString().toLowerCase();
          final location = service['location'].toString().toLowerCase();
          final searchText = query.toLowerCase();

          return title.contains(searchText) ||
              location.contains(searchText);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Visit Planner'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'What do you need today?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Search for a college service to create your visit plan.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            // Search box
            TextField(
              controller: searchController,
              onChanged: searchServices,
              decoration: InputDecoration(
                hintText: 'Search services...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          searchServices('');
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Search results
            Expanded(
              child: filteredServices.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'No service found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Try another service name.',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredServices.length,
                      itemBuilder: (context, index) {
                        final service = filteredServices[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),

                            leading: Icon(
                              service['icon'],
                              size: 32,
                              color: Colors.indigo,
                            ),

                            title: Text(
                              service['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              service['location'],
                            ),

                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VisitPlanDetailsScreen(
                                    serviceName: service['title'],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}