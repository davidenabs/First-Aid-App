
import 'package:first_aid_app/services/emergency_service.dart';
import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => EmergencyService.showEmergencyDialog(context),
      backgroundColor: Color(0xFFD32F2F),
      foregroundColor: Colors.white,
      icon: Icon(Icons.phone),
      label: Text('EMERGENCY'),
    );
  }
}