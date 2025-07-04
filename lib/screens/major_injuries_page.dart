 

 import 'package:first_aid_app/controllers/first_aid_controller.dart';
import 'package:first_aid_app/models/injury.dart';
import 'package:first_aid_app/widgets/emergency_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MajorInjuriesPage extends StatelessWidget {
  final FirstAidController controller = Get.put(FirstAidController());

   MajorInjuriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Major Injuries'),
        backgroundColor: Color(0xFFD32F2F),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: controller.majorInjuries.length,
              itemBuilder: (context, index) {
                final injury = controller.majorInjuries[index];
                return _InjuryCard(
                  injury: injury,
                  onTap: () {
                    controller.selectInjury(injury);
                    Get.toNamed('/detail');
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: EmergencyButton(),
    );
  }
}

class _InjuryCard extends StatelessWidget {
  final Injury injury;
  final VoidCallback onTap;

  const _InjuryCard({
    required this.injury,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF4FC3F7).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  injury.icon,
                  size: 24,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      injury.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
