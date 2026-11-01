import 'package:flutter/material.dart';
import 'visit_plan_details_screen.dart';

class ServiceCategoryScreen extends StatelessWidget {
  final String category;

  const ServiceCategoryScreen({
    super.key,
    required this.category,
  });

  List<Map<String, dynamic>> getServices() {
    switch (category) {
      case 'Academic':
        return [
          {
            'icon': Icons.description,
            'title': 'Bonafide Certificate',
            'subtitle': 'Apply for a bonafide certificate',
          },
          {
            'icon': Icons.badge,
            'title': 'Student ID Card',
            'subtitle': 'Get or update your student ID card',
          },
          {
            'icon': Icons.school,
            'title': 'Transfer Certificate',
            'subtitle': 'Information about transfer certificates',
          },
          {
            'icon': Icons.card_membership,
            'title': 'Scholarship',
            'subtitle': 'Scholarship application and information',
          },
        ];

      case 'Fees':
        return [
          {
            'icon': Icons.payment,
            'title': 'Fee Payment',
            'subtitle': 'View and pay your college fees',
          },
          {
            'icon': Icons.receipt_long,
            'title': 'Fee Receipt',
            'subtitle': 'Download or collect your fee receipt',
          },
          {
            'icon': Icons.account_balance,
            'title': 'Fee Due Details',
            'subtitle': 'Check pending fee details',
          },
          {
            'icon': Icons.help_outline,
            'title': 'Fee Enquiry',
            'subtitle': 'Get help regarding fee-related queries',
          },
        ];

      case 'Exams':
        return [
          {
            'icon': Icons.calendar_month,
            'title': 'Exam Timetable',
            'subtitle': 'View examination schedules',
          },
          {
            'icon': Icons.confirmation_number,
            'title': 'Hall Ticket',
            'subtitle': 'Information about hall tickets',
          },
          {
            'icon': Icons.grade,
            'title': 'Results',
            'subtitle': 'Check examination results',
          },
          {
            'icon': Icons.app_registration,
            'title': 'Exam Registration',
            'subtitle': 'Information about exam registration',
          },
        ];

      case 'Transport':
        return [
          {
            'icon': Icons.directions_bus,
            'title': 'Bus Routes',
            'subtitle': 'Find available college bus routes',
          },
          {
            'icon': Icons.credit_card,
            'title': 'Bus Pass',
            'subtitle': 'Information about bus passes',
          },
          {
            'icon': Icons.location_on,
            'title': 'Bus Stops',
            'subtitle': 'Find nearby college bus stops',
          },
          {
            'icon': Icons.support_agent,
            'title': 'Transport Office',
            'subtitle': 'Contact the transport office',
          },
        ];

      case 'Health':
        return [
          {
            'icon': Icons.local_hospital,
            'title': 'Medical Room',
            'subtitle': 'Find the college medical room',
          },
          {
            'icon': Icons.medical_services,
            'title': 'First Aid',
            'subtitle': 'Get information about first aid facilities',
          },
          {
            'icon': Icons.emergency,
            'title': 'Emergency Contact',
            'subtitle': 'Find emergency contact information',
          },
          {
            'icon': Icons.health_and_safety,
            'title': 'Health Support',
            'subtitle': 'Get campus health support',
          },
        ];

      case 'Technical':
        return [
          {
            'icon': Icons.wifi,
            'title': 'Wi-Fi Support',
            'subtitle': 'Get help with campus Wi-Fi',
          },
          {
            'icon': Icons.computer,
            'title': 'Computer Lab',
            'subtitle': 'Find computer labs and facilities',
          },
          {
            'icon': Icons.settings,
            'title': 'Technical Support',
            'subtitle': 'Report technical issues',
          },
          {
            'icon': Icons.devices,
            'title': 'Device Support',
            'subtitle': 'Get help with college devices',
          },
        ];

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final services = getServices();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Services'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$category Services',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Select a service to view more information.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(14),

                      leading: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          service['icon'],
                          size: 27,
                        ),
                      ),

                      title: Text(
                        service['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          service['subtitle'],
                        ),
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),

                      // Open service details
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