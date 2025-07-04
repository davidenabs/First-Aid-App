
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyService {
  static Future<void> callEmergency() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '911');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  static Future<void> showEmergencyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emergency Call'),
          content: Text('Call emergency services now?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD32F2F),
                foregroundColor: Colors.white,
              ),
              child: Text('Call 911'),
              onPressed: () {
                Navigator.of(context).pop();
                callEmergency();
              },
            ),
          ],
        );
      },
    );
  }
}
