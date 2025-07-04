import 'package:first_aid_app/controllers/first_aid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedFirstAidPage extends StatelessWidget {
  final FirstAidController controller = Get.find();

  DetailedFirstAidPage({super.key});

  @override
  Widget build(BuildContext context) {
    final injury = controller.selectedInjury;

    if (injury == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('No injury selected')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(injury.name),
        backgroundColor: Color(0xFF4FC3F7),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF4FC3F7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        injury.icon,
                        size: 32,
                        color: Color(0xFF4FC3F7),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            injury.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            injury.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Symptoms Section
            _SectionCard(
              title: 'Symptoms',
              icon: Icons.info_outline,
              color: Color(0xFF4FC3F7),
              children: injury.symptoms.map<Widget>((symptom) =>
                _BulletPoint(text: symptom)
              ).toList(),
            ),

            SizedBox(height: 16),

            // First Aid Steps Section
            _SectionCard(
              title: 'First Aid Steps',
              icon: Icons.medical_services,
              color: Color(0xFF26A69A),
              children: injury.firstAidSteps.asMap().entries.map<Widget>((entry) =>
                _NumberedStep(
                  number: entry.key + 1,
                  text: entry.value,
                )
              ).toList(),
            ),

            // Warnings Section
            if (injury.warnings != null && injury.warnings!.isNotEmpty) ...[
              SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFD32F2F).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.warning,
                        color: Color(0xFFD32F2F),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Important Warning',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFD32F2F),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              injury.warnings!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            SizedBox(height: 100), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: EmergencyButton(),
    );
  }
}

// Bullet Point Widget
class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8, right: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Color(0xFF4FC3F7),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Numbered Step Widget
class _NumberedStep extends StatelessWidget {
  final int number;
  final String text;

  const _NumberedStep({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Color(0xFF26A69A),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Section Card Widget
class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

// Dummy EmergencyButton widget for completeness
class EmergencyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFFD32F2F),
      child: Icon(Icons.call, color: Colors.white),
      onPressed: () {
        // Implement emergency call logic here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Emergency call initiated!')),
        );
      },
    );
  }
}
